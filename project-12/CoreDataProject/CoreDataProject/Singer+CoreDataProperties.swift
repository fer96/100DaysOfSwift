//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Fernando De La Rosa on 16/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
		return NSFetchRequest<Singer>(entityName: "Singer")
	}
	
	@NSManaged public var firstName: String?
	@NSManaged public var lastName: String?
	
	var wrappedFirstName: String {
		firstName ?? "Unknown"
	}
	
	var wrappedLastName: String {
		lastName ?? "Unknown"
	}
}
