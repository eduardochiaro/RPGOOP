//
//  Kimara.swift
//  RPGOOP
//
//  Created by Eduardo Chiaro on 12/2/16.
//  Copyright © 2016 Eduardo Chiaro. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Gold Dagger", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override var image: String {
        return "enem1"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr: attackPwr)
        }
        
        return false
    }
}
