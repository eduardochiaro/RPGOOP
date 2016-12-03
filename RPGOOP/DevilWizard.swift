//
//  DevilWizard.swift
//  RPGOOP
//
//  Created by Eduardo Chiaro on 12/2/16.
//  Copyright © 2016 Eduardo Chiaro. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
    override var image: String {
        return "enem2"
    }
}
