//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Tung Nguyen on 04.02.21.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDelegate {
    
    var selectedRestaurant:RestaurantItem?
    var selectedCity:LocationItem?
    var selectedType:String?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let location = selectedCity?.city, let filter = selectedType else { return }
        let manager = RestaurantDataManager()
        manager.fetch(by: location, with: filter) { items in
            if manager.numberOfItems() > 0 {
                for item in items {
                    if let itemName = item.name {
                        print(itemName)
                    }
                }
            } else {
                print("No data")
            }
        }
    }
}

// MARK: Private Extension
private extension RestaurantListViewController {
    // code goes here
}

// MARK: UICollectionViewDataSource
extension RestaurantListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
}
