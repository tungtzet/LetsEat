//
//  LocationViewController.swift
//  LetsEat
//
//  Created by Michael Nguyen on 04.02.21.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let manager = LocationDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.fetch()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = manager.locationItem(at: indexPath)
        return cell
    }
    

    
}
