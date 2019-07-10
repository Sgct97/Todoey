//
//  Item.swift
//  Todoey
//
//  Created by Spenser Courville-Taylor on 6/27/19.
//  Copyright © 2019 Spenser Courville-Taylor. All rights reserved.
//

import Foundation
import RealmSwift


class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated : Date?
        var parentCatrgory = LinkingObjects(fromType: Category.self, property: "items")
}
