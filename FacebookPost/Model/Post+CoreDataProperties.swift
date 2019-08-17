//
//  Post+CoreDataProperties.swift
//  FacebookPost
//
//  Created by Crypto on 8/17/19.
//  Copyright © 2019 Crypto. All rights reserved.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var body: String?
    @NSManaged public var date: String?
    @NSManaged public var name: String?
    @NSManaged public var postImage: NSData?
    @NSManaged public var profileImage: NSData?
    @NSManaged public var comment: NSSet?

}

// MARK: Generated accessors for comment
extension Post {

    @objc(addCommentObject:)
    @NSManaged public func addToComment(_ value: Comment)

    @objc(removeCommentObject:)
    @NSManaged public func removeFromComment(_ value: Comment)

    @objc(addComment:)
    @NSManaged public func addToComment(_ values: NSSet)

    @objc(removeComment:)
    @NSManaged public func removeFromComment(_ values: NSSet)

}
