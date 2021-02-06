//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Tung Nguyen on 04.02.21.
//

import Foundation

class ExploreDataManager: DataManager {
    fileprivate var items: [ExploreItem] = []
    
    func fetch() {
        for data in load(file: "ExploreData") {
            items.append(ExploreItem(dict: data))
        }
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem {
        items[index.item]
    }
}
