//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var businesses: [Business]!
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension // use whatever constraints were given to the tableview
        tableView.estimatedRowHeight = 120 // for scroll row height

        //implementing search Controller
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        //searchBar.delegate = self.searchController.searchBar.delegate
        
        //sets the search bar to a navigational view
        self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
        
        Business.searchWithTerm("Restaurants", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        
        //   for business in businesses {
        //    print(business.name!)
        //    print(business.address!)
        //    }
        })

/* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
*/
    }
    
    
  /*  func searchBarSearchButtonClicked( searchBar: UISearchBar!)
    {
        let searchTerm = searchController.searchBar.text!
        Business.searchWithTerm(searchTerm, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        })
    }
    */
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
            if let searchTerm = searchController.searchBar.text{
                if !searchTerm.isEmpty{
                Business.searchWithTerm(searchTerm, completion: { (businesses: [Business]!, error: NSError!) -> Void in
                    self.businesses = businesses
                    self.tableView.reloadData()
                })
                tableView.reloadData()
                }
        }
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if businesses != nil{
            return businesses!.count
        }
        else {
            return 0
        }
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        if let business = cell.business {
            //  print("Search term exists")
            cell.nameLabel.text = business.name
            cell.thumbimageView.setImageWithURL(business.imageURL!)
            cell.categoryLabel.text = business.categories
            cell.addressLabel.text = business.address
            cell.reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            cell.ratingImageView.setImageWithURL(business.ratingImageURL!)
            cell.distanceLabel.text = business.distance
            
        }
            
        else {
           // print("search term does not exist")
            //no business
            cell.nameLabel.text = nil
            cell.thumbimageView.image = nil
            cell.categoryLabel.text = nil
            cell.addressLabel.text = nil
            cell.reviewsCountLabel.text = nil
            cell.ratingImageView.image = nil
            cell.distanceLabel.text = nil
        }
        
        
        return cell
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cell = sender as! BusinessCell
        let indexPath = tableView.indexPathForCell(cell)
        let business = businesses[indexPath!.row]
        
        //only called when going forward, not backward
        //if you do option + press detailViewController.. can see its type
        let DetailViewController = segue.destinationViewController as! detailViewController
        
        DetailViewController.business = business
    
    
    }
    

}
