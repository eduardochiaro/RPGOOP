//
//  ViewController.swift
//  RPGOOP
//
//  Created by Eduardo Chiaro on 12/2/16.
//  Copyright © 2016 Eduardo Chiaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHPLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    @IBOutlet weak var attackBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chestBtn.isHidden = true
        
        player = Player(name: "Hero", hp: 110, attackPwr: 20)
        
        playerHPLbl.text = "\(player.hp) HP"
        
        generateRandomEnemy()
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        
        print(enemy.image)
        
        let imageName = enemy.image
        let image = UIImage(named: imageName)
        //let imageView = UIImageView(image: image!)
        enemyImg.image = image
        
        enemyImg.isHidden = false
        attackBtn.isHidden = false
        
        enemyHPLbl.text = "\(enemy.hp) HP"
        printLbl.text = "\(enemy.type) appear"
    }
    
    @IBAction func onChestTapped(_ sender: Any) {
        chestBtn.isHidden = true
        printLbl.text = chestMessage
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.generateRandomEnemy), userInfo: nil, repeats: false)
    }

    @IBAction func onAttackTapped(_ sender: Any) {
        if enemy.attemptAttack(attackPwr: player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessuful!"
        }
        playerHPLbl.text = "\(player.hp) HP"
        
        
        if let loot = enemy.dropLoot() {
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.isHidden = false
            attackBtn.isHidden = true
            player.addItemToInventory(newItem: loot)
        }
        
        if !enemy.isAlive {
            enemyImg.isHidden = true
            enemyHPLbl.text = ""
            printLbl.text = "\(enemy.type) Killed"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

