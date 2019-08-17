//
//  CommentsViewController.swift
//  FacebookPost
//
//  Created by Crypto on 8/17/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    
    @IBOutlet weak var buttonComment: UIButton!
    @IBOutlet weak var textFieldComment: UITextField!
    var viewModel: PostViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        commentsTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        
        commentsTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
    }
    
    @IBAction func buttonCommentAction(_ sender: Any) {
        
        let userImage = UIImage(data: (viewModel?.post?.profileImage! as Data?)!)
        
        viewModel?.saveComment(userImage: userImage, userName: viewModel?.post?.name, body: textFieldComment.text)
        textFieldComment.text =  "" 
        textFieldComment.placeholder = "Write a Comment..."
        viewModel?.fetchComment()
        self.commentsTableView.reloadData()
    }
    
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return viewModel?.comments.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            
            let postCell = commentsTableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            
            if let image = viewModel!.post!.postImage {
                postCell.postedImage.image = UIImage(data: image as Data)
            }
            postCell.profileImageOutlett.image = UIImage(data: viewModel!.post!.profileImage! as Data)
            postCell.lblPosttext.text = viewModel!.post!.body
            postCell.lblUserName.text = viewModel!.post!.name
            postCell.postDate.text = viewModel!.post!.date
            return postCell
        default:
            let comment = viewModel?.comments[indexPath.row]
            let commentCell = commentsTableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            if let data = comment?.userImage {
                commentCell.imageViewUser.image = UIImage(data: data as Data)
            }
            commentCell.lblCommentBody.text = comment?.commentBody
            commentCell.lblUserName.text = comment?.userName
            return commentCell
        }
    }
    
    
}
