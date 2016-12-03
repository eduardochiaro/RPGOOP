//
//  Enemy.swift
//  RPGOOP
//
//  Created by Eduardo Chiaro on 12/2/16.
//  Copyright © 2016 Eduardo Chiaro. All rights reserved.
//

import Foundation

class Enemy: Character {
    private var _name = "Enemy"
    private var _image = "enem1"
    
    var name: String {
        get {
            return _name
        }
    }
    
    var image: String {
        get {
            return self._image
        }
    }
    
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            
            return loot[rand]
        }
        
        return nil
    }
}
