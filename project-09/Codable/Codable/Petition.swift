//
//  Petition.swift
//  Codable
//
//  Created by Fernando De La Rosa on 12/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

struct Petition: Codable {
	var title: String
	var body: String
	var signatureCount: Int
}
