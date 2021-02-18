//
//  FilterManager.swift
//  LetsEat
//
//  Created by Michael Nguyen on 18.02.21.
//

import Foundation

class FilterManager:DataManager {
    func fetch(completionHandler:(_ items: [FilterItem]) -> Void) {
        var items:[FilterItem] = []
        for data in load(file: "FilterData") {
            items.append(FilterItem(dict: data))
        }
        completionHandler(items)
    }
}
