//
//  PostViewModel.swift
//  FacebookPost
//
//  Created by Crypto on 8/4/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PostViewModel {
    var posts = [Post]()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    
    
    
    func fetchDate() {
        context = (appDelegate?.persistentContainer.viewContext)!
        
        do {
            let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
            posts = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    func savePost(userImage: UIImage?, username: String?, body: String?, postImage: UIImage?) {
        
        context = (appDelegate?.persistentContainer.viewContext)!
        
        let post = Post(context: context)
        post.profileImage = userImage?.jpegData(compressionQuality: 1) as NSData?
        post.name = username
        post.date = getStringDateFrom(date: Date(), formate:" E, d MMM yyyy h:mm a")
            
            
            
//            "yyyy MM dd HH:mm")
        post.body = body
        post.postImage = postImage?.jpegData(compressionQuality: 1) as NSData?
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
    }
    
    
    
    
    func getStringDateFrom(date: Date, formate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        let stringDate = dateFormatter.string(from: date)
        
        return stringDate
        
    }
}
