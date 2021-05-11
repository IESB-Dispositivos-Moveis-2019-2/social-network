//
//  PostTableViewCell.swift
//  SocialNetwork
//
//  Created by Pedro Henrique on 10/05/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let kReuseIdentifier = "PostTableViewCell"
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var postTimestamp: UILabel!
    @IBOutlet weak var postBody: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postLink: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var likeStatus: UILabel!
    @IBOutlet weak var commentStatus: UILabel!
    
    
    @IBAction func onLike(_ sender: UIButton) {
    }
    
    @IBAction func onComment(_ sender: UIButton) {
    }
    
    @IBAction func onShare(_ sender: UIButton) {
    }
    
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: "PostTableViewCell", bundle: Bundle(for: PostTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with data: String) {
//        postBody.text = data
        
        profilePictureImageView.image = UIImage(data: try! Data(contentsOf: URL(string: "http://lorempixel.com.br/120/120")!))
        
        let width = Int(UIScreen.main.nativeBounds.size.width)
        let height = Int(width * (9/16))
        
        postImage.image = UIImage(data: try! Data(contentsOf: URL(string: "http://lorempixel.com.br/\(width)/\(height)")!))
        
    }
    
}
