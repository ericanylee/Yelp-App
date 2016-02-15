//
//  detailViewController.swift
//  Yelp
//
//  Created by Erica Lee on 2/14/16.
//  Copyright © 2016 Erica Lee. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var dealLabel: UILabel!
    var business: Business!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height+50)
        restaurantImageView.setImageWithURL(business.imageURL!)
        nameLabel.text = business.name
        if business.number != nil {
            numberLabel.text = "Number : " + business.number!
        }
        if business.menu != nil{
            menuLabel.text = "Menu provider : " + business.menu!
        }
        
        if business.deals != nil{
            dealLabel.text = business.deals
        }
        
        numberLabel.sizeToFit()
        numberLabel.sizeToFit()
        dealLabel.sizeToFit()
        
        restaurantImageView.layer.cornerRadius = 5 // make image rounder
        restaurantImageView.clipsToBounds = true //clip to bitmap?
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
