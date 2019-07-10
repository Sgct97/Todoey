//
//  Data.swift
//  Todoey
//
//  Created by Spenser Courville-Taylor on 6/23/19.
//  Copyright © 2019 Spenser Courville-Taylor. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
