//
//  DeathScene.swift
//  Drowsy Driving Test
//
//  Created by Tannay Chandhok on 6/23/17.
//  Copyright © 2017 NoLo. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class DeathScene: SKScene {
    
    var PlayAgainButtonNode:SKSpriteNode!
    var HomeButtonNode: SKSpriteNode!
    var factBar:SKSpriteNode!
    
    var gameScene = GameScene()
    
    var timelabel : UILabel!
    var highscorelabel : UILabel!
    
    var sleepFactz = [String]()
    
    override func didMove(to view: SKView) {
        
        timelabel = UILabel(frame: CGRect(x: self.frame.width/8, y: self.frame.height/5, width: 150, height: 20))
        highscorelabel = UILabel(frame: CGRect(x: self.frame.width/4, y: self.frame.height/5, width: 150, height: 20))
        
        sleepFactz = ["Fact1","Fact2","Fact3","Fact4","Fact5"]
        
        PlayAgainButtonNode = self.childNode(withName: "PlayAgainNode") as! SKSpriteNode
        HomeButtonNode = self.childNode(withName: "HomeNode") as! SKSpriteNode
        
        
        factBar = self.childNode(withName: "factBar") as! SKSpriteNode
        factBar.texture = SKTexture(imageNamed: (String)(sleepFactz[Int(arc4random_uniform(5))]))
        factBar.color = .clear
        
        timelabel.textAlignment = NSTextAlignment.left
        timelabel.textColor = .white
        timelabel.text = "Time: " + String( gameScene.getFinishTime())
        
        highscorelabel.textAlignment = NSTextAlignment.left
        highscorelabel.textColor = .white
        highscorelabel.text = "Highscore: " + String( gameScene.getHighScore())
        
        let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.view?.addSubview(self.timelabel)
            self.view?.addSubview(self.highscorelabel)
        }

        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "HomeNode" {
                timelabel.isHidden = true
                highscorelabel.isHidden = true
                let transition = SKTransition.reveal(with: SKTransitionDirection.down, duration: 1)
                let gameScene = StartScene(fileNamed: "MenuScene")
                gameScene?.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: transition)
            }
            if nodesArray.first?.name == "PlayAgainNode" {
                timelabel.isHidden = true
                highscorelabel.isHidden = true
                let transition = SKTransition.reveal(with: SKTransitionDirection.down, duration: 1)
                let gameScene = StartScene(fileNamed: "GameScene")
                gameScene?.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: transition)
            }
        }
    }
}
