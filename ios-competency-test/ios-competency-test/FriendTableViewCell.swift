//
//  FriendTableViewCell.swift
//  ios-competency-test
//
//  Created by Sam Gubler on 3/27/15.
//  Copyright (c) 2015 Sam Gubler. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var availabilityImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var friend : Friend?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.availabilityImageView.layer.cornerRadius = 10
        self.availabilityImageView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWithFriend(friend : Friend)
    {
        self.friend = friend

        self.availabilityImageView.image = friend.available == true ? UIImage(named: "green") : UIImage(named: "red")
        
        self.nameLabel.text = "\(friend.firstName!) \(friend.lastName!)"
        self.statusLabel.text = friend.status!
        
        self.myImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: friend.img!)!)!)
    }

}
