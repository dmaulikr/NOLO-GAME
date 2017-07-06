//
//  LearnMoreScene.swift
//  Drowsy Driving Test
//
//  Created by Tannay Chandhok on 6/23/17.
//  Copyright © 2017 NoLo. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class LearnMoreScene: SKScene {
    
    var twitterButtonNode: SKSpriteNode!
    var homeButtonNode:SKSpriteNode!
    var googleButtonNode: SKSpriteNode!

    let welcomeScene = WelcomeScene()
    
    let nameLabel = UILabel(frame: CGRect(x: 6, y: -20, width: 300, height: 100))
    
    override func didMove(to view: SKView) {
        
        homeButtonNode = self.childNode(withName: "HomeNodeImage") as! SKSpriteNode
        homeButtonNode.texture = SKTexture(imageNamed: "HomeIcon")
        homeButtonNode.color = .clear
        
        googleButtonNode = self.childNode(withName: "GoogleNode") as! SKSpriteNode
        googleButtonNode.texture = SKTexture(imageNamed: "GoogleIcon")
        googleButtonNode.color = .clear
        
        twitterButtonNode = self.childNode(withName: "TwitterNode") as! SKSpriteNode
        twitterButtonNode.texture = SKTexture(imageNamed: "TwitterIcon")
        twitterButtonNode.color = .clear
        
        let name = String(welcomeScene.getName())
        nameLabel.attributedText = NSAttributedString(string: name!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        self.view?.addSubview(nameLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "HomeNode" {
                nameLabel.isHidden = true
                let transition = SKTransition.reveal(with: SKTransitionDirection.right, duration: 0.5)
                let gameScene = MenuScene(fileNamed: "MenuScene")
                gameScene?.scaleMode = .aspectFill
                self.view?.presentScene(gameScene!, transition: transition)
            }
            if nodesArray.first?.name == "GoogleNode"{
                nameLabel.isHidden = true
                if let google = NSURL(string: "http://www.google.com"){
                    UIApplication.shared.open(google as URL, options: [:], completionHandler: nil)
                }
            }
            if nodesArray.first?.name == "TwitterNode"{
                namelabel.isHidden = true
                    let screenName =  "@NOLO716"
                    let appURL = NSURL(string: "twitter://user?screen_name=\(screenName)")!
                    let webURL = NSURL(string: "https://twitter.com/\(screenName)")!
    
                    let application = UIApplication.shared
                    if application.openURL(appURL as URL) {
                    }
                    else {
                        application.openURL(webURL as URL)
                    }
                }
        }
    }
}
