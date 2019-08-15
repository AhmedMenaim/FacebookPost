//
//  Post+CoreDataProperties.swift
//  FacebookPost
//
//  Created by Crypto on 8/3/19.
//  Copyright © 2019 Crypto. All rights reserved.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var body: String?
    @NSManaged public var profileImage: NSData?
    @NSManaged public var postImage: NSData?

}
