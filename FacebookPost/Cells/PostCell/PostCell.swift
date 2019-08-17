//
//  PostCell.swift
//  FacebookPost
//
//  Created by Crypto on 8/3/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var profileImageOutlett: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var lblPosttext: UILabel!
    @IBOutlet weak var postedImage: UIImageView!
    weak var delegate: OptionsViewDelegate?
    weak var delegatee: PostDelegate?
    var post: Post?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageOutlett.cornerRadius = profileImageOutlett.frame.height / 2
    }
    
    @IBAction func buttonCommentPressedAction(_ sender: Any) {
        
        delegatee?.didOpenComment(post: self.post!)
        
        
    }
}

protocol PostDelegate: class {
    func didOpenComment(post: Post)
}
