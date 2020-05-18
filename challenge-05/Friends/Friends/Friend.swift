//
//  Friend.swift
//  Friends
//
//  Created by Fernando De La Rosa on 17/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

struct Friend: Codable {
	var id: String
	var name: String
}

extension Friend: Identifiable {}
