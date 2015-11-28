//
//  Kimara.swift
//  rpgoop
//
//  Created by David Pavel on 11/28/15.
//  Copyright © 2015 8R. All rights reserved.
//

import Foundation


class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide","Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= IMMUNE_MAX {
            return super.attemptAttack(attackPower)
        }
        return false
    }
}