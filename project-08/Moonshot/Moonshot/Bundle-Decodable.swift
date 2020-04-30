//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Fernando De La Rosa on 30/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

extension Bundle {
	func decode<T: Codable>(_ file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Fail to locate \(file) from bundle")
		}
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Fail to locate \(file) from bundle")
		}
		
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "y-MM-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Fail to decode \(file) from bundle")
		}
		
		return loaded
	}
}
