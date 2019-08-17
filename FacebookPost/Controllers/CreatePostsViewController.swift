//
//  ViewController.swift
//  FacebookPost
//
//  Created by Crypto on 8/2/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit
import CoreData

class CreatePostsViewController: UIViewController, UITextViewDelegate {
    
    
    var viewModel: PostViewModel?
    @IBOutlet weak var profileImageViewOutlet: UIImageView!
    @IBOutlet weak var lblUserNameeOutlett: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var imageWillbePostedOutlet: UIImageView!
    
    
    
    var containerViewController: OptionsTableViewController?
    let containerSegueName = "OptionsContainerView"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       postTextView.text = "What's on your mind ?"
        postTextView.textColor = UIColor.lightGray
        self.title = "Create Post"
         profileImageViewOutlet.cornerRadius = profileImageViewOutlet.frame.height / 2
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(savePost))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == containerSegueName {
            containerViewController = segue.destination as? OptionsTableViewController
            containerViewController?.delegate = self
            }
        }





    @objc func savePost() {
        
        guard imageWillbePostedOutlet.image != nil || !postTextView.text.isEmpty else {return}
        viewModel?.savePost(userImage: profileImageViewOutlet.image, username: lblUserNameeOutlett.text, body: postTextView.text, postImage: imageWillbePostedOutlet.image)
        self.navigationController?.popViewController(animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's on your mind ?"
            textView.textColor = UIColor.lightGray
        }
    }

}


extension CreatePostsViewController: OptionsViewDelegate {
    func didSetImage(image: UIImage) {
        self.imageWillbePostedOutlet.image = image
    }
}
