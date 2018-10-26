//
//  Item.swift
//  Todoey
//
//  Created by Prakhar Srivastava on 24/10/18.
//  Copyright © 2018 Prakhar Srivastava. All rights reserved.
//

import Foundation

class Item: Codable { //Encodable + Decodable = Codable
    var itemTitle : String = ""
    var isDone : Bool = false
}
