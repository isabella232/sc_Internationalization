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
	
	private var replies = [NSLocalizedString("Hello, Peter. Nice to meet you!", comment: "Translate text: Hello, Peter. Nice to meet you!"), NSLocalizedString("How are you?", comment: "Translate text: How are you?"), NSLocalizedString("I am good. And you?", comment: "Translate text: I am good. And you?"), NSLocalizedString("I'm doing well, thank you.", comment: "Translate text: I'm doing well, thank you."), NSLocalizedString("See you tomorrow?", comment: "Translate text: See you tomorrow?"), NSLocalizedString("Sure!", comment: "Translate text: Sure!")]
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
		row.text = NSLocalizedString("Hello, my name is Peter.", comment: "Translate text: Hello, my name is Peter.")
		data.append(row)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK:- Actions
	@IBAction func addReply() {
		if replyIndex >= replies.count {
			let alert = UIAlertController(title: NSLocalizedString("Peter is tired", comment: "Translate text: Peter is tired"), message: NSLocalizedString("Restart for more conversation.", comment: "Translate text: Restart for more conversation."), preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Translate text: OK"), style: UIAlertActionStyle.default, handler: nil))
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

