//
//  RestaurantDetailTableViewController.swift
//  LetsEat
//
//  Created by Michael Nguyen on 07.02.21.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant: RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // to print the RestaurantItem instance's contents to the Debug area
        dump(selectedRestaurant as Any)
    }




}
