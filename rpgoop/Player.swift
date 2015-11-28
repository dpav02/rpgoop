//
//  Player.swift
//  rpgoop
//
//  Created by David Pavel on 11/28/15.
//  Copyright © 2015 8R. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    private var _inventory = [String]()
    
    var name: String {
        get {
            return _name
        }
    }
    
    var inventory: [String] {
            return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, attackPower: attackPower)
        _name = name
    }
    
}