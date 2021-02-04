//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Tung Nguyen on 04.02.21.
//

import Foundation

class ExploreDataManager {
    fileprivate var items: [ExploreItem] = []
    
    func fetch() {
        for data in loadData() {
            items.append(ExploreItem(dict: data))
        }
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path (forResource: "ExploreData", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String:AnyObject]]
    }
}
