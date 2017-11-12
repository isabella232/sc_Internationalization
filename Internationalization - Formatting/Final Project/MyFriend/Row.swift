//
//  Row.swift
//  MyFriend
//
//  Created by Fahim Farook on 27/9/2017.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation

enum RowType:Int {
	case friend, you
}

struct Row {
	var type = RowType.friend
	var text = ""
}
