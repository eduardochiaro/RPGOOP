//
//  Player.swift
//  RPGOOP
//
//  Created by Eduardo Chiaro on 12/2/16.
//  Copyright © 2016 Eduardo Chiaro. All rights reserved.
//

import Foundation


class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory (newItem: String) {
        _inventory.append(newItem)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        self._name = name
    }
}
