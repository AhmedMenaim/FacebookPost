//
//  OptionsTableViewController.swift
//  FacebookPost
//
//  Created by Crypto on 8/3/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit


class OptionsTableViewController: UITableViewController {
    var viewModel: PostViewModel?
//    var createPost = CreatePostsViewController()
    
    weak var delegate: OptionsViewDelegate?
    var image: UIImage? {
        didSet {
            guard self.image != nil else { return }
            delegate?.didSetImage(image: self.image!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            switch indexPath.row {
            case 0:
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .photoLibrary
                    imagePickerController.delegate = self
                    self.present(imagePickerController, animated: true, completion: nil)
                }
         
            default:
                print("you have an error")
            }
   
        default:
            print("you have an error")
        }
    }
    
}


extension OptionsTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
}


protocol OptionsViewDelegate: class {
    func didSetImage(image: UIImage)
}
