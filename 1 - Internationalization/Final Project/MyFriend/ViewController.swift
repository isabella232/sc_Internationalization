/**
* Copyright (c) 2017 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
* distribute, sublicense, create a derivative work, and/or sell copies of the
* Software in any work that is designed, intended, or marketed for pedagogical or
* instructional purposes related to programming, coding, application development,
* or information technology.  Permission for such use, copying, modification,
* merger, publication, distribution, sublicensing, creation of derivative works,
* or sale is expressly withheld.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

final class ViewController: UIViewController {
	@IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var taglineLabel: UILabel!
  @IBOutlet private var table: UITableView!
  @IBOutlet private var replyButton: UIButton!
  @IBOutlet private var dateLabel: UILabel! {
    didSet {
      let dateFormatter = DateFormatter()
      dateFormatter.locale = .current
      dateFormatter.dateStyle = .long
      dateLabel.text = dateFormatter.string(from: Date())
    }
  }
  
  private var replies = [
    NSLocalizedString(
      "Hello, Peter. Nice to meet you!",
      comment: "Translate text: Hello, Peter. Nice to meet you!"
    ),
    NSLocalizedString(
      "How are you?",
      comment: "Translate text: How are you?"
    ),
    NSLocalizedString(
      "I am good. And you?",
      comment: "Translate text: I am good. And you?"
    ),
    NSLocalizedString(
      "I'm doing well, thank you.",
      comment: "Translate text: I'm doing well, thank you."
    ),
    NSLocalizedString(
      "See you tomorrow?",
      comment: "Translate text: See you tomorrow?"
    ),
    NSLocalizedString(
      "Sure!",
      comment: "Translate text: Sure!"
    )
  ]
  
  private var data = [
    Row(type: .friend, text: "Hello, my name is Peter.")
  ]
  private var replyIndex = 0

// MARK:- Actions
	@IBAction func addReply() {
		guard replyIndex < replies.count
    else {
			let alert = UIAlertController(title: "Peter is tired", message: "Restart for more conversation.", preferredStyle: .alert)
			alert.addAction( UIAlertAction(title: "OK", style: .default) )
			present(alert, animated: true)
			return
		}
		replyButton.isEnabled = false
		let reply = replies[replyIndex]
		replyIndex += 1
		next(reply: reply)
	}
	
// MARK:- Private Methods
	private func next(reply: String? = nil) {
    let row: Row
    let autoReply: Bool
		if let reply = reply {
      row = Row(type: .you, text: reply)
			autoReply = true
		} else {
      row = Row(type: .friend, text: replies[replyIndex])
      autoReply = false
			replyIndex += 1
		}
		// Add new row
		let index = data.count
		data.append(row)
		let indexPath = IndexPath(row: index, section: 0)
		table.insertRows(at: [indexPath], with: autoReply ? .right : .left)
		table.scrollToRow(at: indexPath, at: .bottom, animated: false)
		
    // Should there be a reply?
		if autoReply {
			// Reply after a short delay
			DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
				self.next()
				self.replyButton.isEnabled = true
			}
		}
	}
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
	func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = data[indexPath.row]
		
    let cell = tableView.dequeueReusableCell(
      withIdentifier: {
        switch row.type {
        case .friend: return "FriendCell"
        case .you: return "YouCell"
        }
      }()
    )!
    
		if let label = cell.viewWithTag(100) as? UILabel {
			label.text = row.text
		}
    
		return cell
	}
}

