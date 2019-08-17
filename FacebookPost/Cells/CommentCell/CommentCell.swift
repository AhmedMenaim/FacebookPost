//
//  CommentCell.swift
//  FacebookPost
//
//  Created by Crypto on 8/17/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var lblCommentBody: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var containerViewOutlet: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerViewOutlet.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
