//
//  Item.swift
//  Todoey
//
//  Created by Topik Hidayat on 2/21/18.
//  Copyright © 2018 Topik Hidayat. All rights reserved.
//

import Foundation

public class Item {
    var name : String
    var checked : Bool
    
    init (name:String) {
        self.name = name
        checked = false
    }
    
    init(name:String, checked:Bool) {
        self.name = name;
        self.checked = checked
    }
}
