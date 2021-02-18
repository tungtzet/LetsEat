//
//  FilterItem.swift
//  LetsEat
//
//  Created by Michael Nguyen on 18.02.21.
//

import Foundation

class FilterItem:NSObject {
    let filter:String
    let name:String
    init(dict: [String:AnyObject]) {
        name = dict["name"] as! String
        filter = dict["filter"] as! String
    }
}
