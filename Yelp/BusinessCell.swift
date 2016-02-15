//
//  BusinessCell.swift
//  Yelp
//
//  Created by Erica Lee on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbimageView: UIImageView!
    var business: Business!
 
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        thumbimageView.layer.cornerRadius = 5 // make image rounder
        thumbimageView.clipsToBounds = true //clip to bitmap?
    
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width // To make sure namelabel doesn't truncate
    }
    
    override func layoutSubviews() { // for horizontal rotation
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width // To make sure namelabel doesn't truncate
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
