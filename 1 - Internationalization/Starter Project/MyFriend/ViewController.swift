//
//  ViewController.swift
//  MyFriend
//
//  Created by Fahim Farook on 27/9/2017.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet private weak var lblTitle: UILabel!
	@IBOutlet private weak var lblDate: UILabel!
	@IBOutlet private weak var lblTagline: UILabel!
	@IBOutlet private weak var table: UITableView!
	@IBOutlet private weak var btnReply: UIButton!
	
	private var replies = ["Hello, Peter. Nice to meet you!", "How are you?", "I am good. And you?", "I'm doing well, thank you.", "See you tomorrow?", "Sure!"]
	private var data = [Row]()
	private var replyIndex = 0
	private let fmt = DateFormatter()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Show date
		fmt.locale = Locale.current
		fmt.dateStyle = DateFormatter.Style.long
		lblDate.text = fmt.string(from: Date())
		// Set up initial data
		var row = Row()
		row.text = "Hello, my name is Peter."
		data.append(row)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK:- Actions
	@IBAction func addReply() {
		if replyIndex >= replies.count {
			let alert = UIAlertController(title: "Peter is tired", message: "Restart for more conversation.", preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
			present(alert, animated: true, completion: nil)
			return
		}
		btnReply.isEnabled = false
		let reply = replies[replyIndex]
		replyIndex += 1
		next(reply: reply)
	}
	
	// MARK:- Private Methods
	private func next(reply:String? = nil) {
		var row = Row()
		var autoReply = false
		if let reply = reply {
			row.type = RowType.you
			row.text = reply
			autoReply = true
		} else {
			row.type = RowType.friend
			row.text = replies[replyIndex]
			replyIndex += 1
		}
		// Add new row
		let index = data.count
		data.append(row)
		let indexPath = IndexPath(row: index, section: 0)
		let animation = autoReply ? UITableViewRowAnimation.right : UITableViewRowAnimation.left
		table.insertRows(at: [indexPath], with: animation)
		table.scrollToRow(at: indexPath, at: UITableViewScrollPosition.bottom, animated: false)
		// Should there be a reply?
		if autoReply {
			// Reply after a short delay
			DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 2.0, execute: {
				self.next()
				self.btnReply.isEnabled = true
			})
		}
	}
	
	// MARK:- Table View Delegates
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = data[indexPath.row]
		let cell:UITableViewCell?
		if row.type == RowType.friend {
			cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell")
		} else {
			cell = tableView.dequeueReusableCell(withIdentifier: "YouCell")
		}
		if let label = cell?.viewWithTag(100) as? UILabel {
			label.text = row.text
		}
		return cell!
	}
}

