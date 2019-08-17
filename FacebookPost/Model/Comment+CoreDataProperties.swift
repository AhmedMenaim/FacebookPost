//
//  Comment+CoreDataProperties.swift
//  FacebookPost
//
//  Created by Crypto on 8/17/19.
//  Copyright © 2019 Crypto. All rights reserved.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var userImage: NSData?
    @NSManaged public var userName: String?
    @NSManaged public var commentBody: String?
    @NSManaged public var post: Post?

}
