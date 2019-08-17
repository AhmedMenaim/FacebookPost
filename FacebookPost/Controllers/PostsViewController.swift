//
//  PostsViewController.swift
//  FacebookPost
//
//  Created by Crypto on 8/3/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit
import CoreData

class PostsViewController: UIViewController {

 
    @IBOutlet weak var postsTableView: UITableView!
    weak var delegate: OptionsViewDelegate?
    
    var image: UIImage? {
        didSet {
            guard self.image != nil else { return }
            delegate?.didSetImage(image: self.image!)
        }
    }
    var viewModel = PostViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.posts.sort(by: {_,_ in .orderedDescending })
        self.title = "Facebook"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
        postsTableView.register(UINib(nibName:"PostCell",bundle: nil), forCellReuseIdentifier: "PostCell")
//
//        for i in 0...viewModel.posts.count {
//            if viewModel.posts[i].date as Date < viewModel.posts[i + 1].date as Date {
//
//            }
//        }
        // Do any additional setup after loading the view.
    }
    
    
    @objc func addPost () {
        
        let CreatePostsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreatePostsViewController") as! CreatePostsViewController
       
            CreatePostsViewController.viewModel = viewModel
        self.navigationController?.pushViewController(CreatePostsViewController, animated: true)
    }


}
extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = viewModel.posts[indexPath.row]
        
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        if let image = post.postImage {
            cell.postedImage.image = UIImage(data: image as Data)
        }
        cell.profileImageOutlett.image = UIImage(data: post.profileImage! as Data)
        cell.lblPosttext.text = post.body
        cell.lblUserName.text = post.name
        cell.postDate.text = post.date
        cell.post = post
        cell.delegatee = self
        return cell
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewModel.fetchPost()
        postsTableView.reloadData()
        
        
    }
    

    

}

extension PostsViewController: PostDelegate {
    func didOpenComment(post: Post) {
        
        let commentsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        viewModel.post = post
        
        if let postComments = post.comment?.allObjects {
            viewModel.comments = postComments as! [Comment]
        }
        commentsViewController.viewModel = viewModel
        self.navigationController?.pushViewController(commentsViewController, animated: true)
        
    }
    
    
}


