//
//  Category.swift
//  Todoey
//
//  Created by Spenser Courville-Taylor on 6/27/19.
//  Copyright © 2019 Spenser Courville-Taylor. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    
    let items = List<Item>()
    
}
