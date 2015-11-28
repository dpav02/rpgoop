//
//  ViewController.swift
//  rpgoop
//
//  Created by David Pavel on 11/28/15.
//  Copyright © 2015 8R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!

    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var playerHPLabel: UILabel!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Dirty Laundry21", hp: 110, attackPower: 20)
        playerHPLabel.text = "\(player.hp) HP"
        playerHPLabel.hidden = false
        
        generateRandomEnemy()
        
        enemyHPLabel.text = "\(enemy.hp) HP"
        enemyHPLabel.hidden = false
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        switch (rand) {
            case 0: enemy = Kimara(startingHp: 50, attackPower: 12)
            default: enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        
        enemyImage.hidden = false
        if let newEnemyHP: Int! = enemy.hp {
            enemyHPLabel.text = "\(newEnemyHP) HP"
        } else {
            enemyHPLabel.text = ""
        }
    }

    @IBAction func onAttackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPower) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found a \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
}

