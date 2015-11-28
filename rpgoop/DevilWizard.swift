//
//  DevilWizard.swift
//  rpgoop
//
//  Created by David Pavel on 11/28/15.
//  Copyright © 2015 8R. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}