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
import SafariServices

class LearnMoreScene: SKScene {
    
    var playViewController = (UIApplication.shared.delegate as! AppDelegate).playViewController!
    
    var infoLabel : UILabel!
    var googleButtonNode: SKSpriteNode!
    var twitterButtonNode: SKSpriteNode!
    var snapchatButtonNode: SKSpriteNode!
    var instagramButtonNode: SKSpriteNode!
    var facebookButtonNode: SKSpriteNode!
    var websiteIconNode: SKSpriteNode!
    
    let welcomeScene = WelcomeScene()
    let gameViewController = GameViewController()

    var nameLabel : UILabel!
    
    override func didMove(to view: SKView) {
        
        if(UIScreen.main.bounds.height == 480){
            nameLabel = UILabel(frame: CGRect(x: 30, y: 2, width: 150, height: 50))
            infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 270))
            infoLabel.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3.5)
            infoLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 15)
        }else if(UIScreen.main.bounds.height == 568){
            nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 50))
            infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 270))
            infoLabel.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3.5)
            infoLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 18)
        }else if(UIScreen.main.bounds.height == 736){
            nameLabel = UILabel(frame: CGRect(x: 6, y: -15, width: 150, height: 100))
            infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 260))
            infoLabel.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3.5 + 2)
            infoLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 25)
        }else{
            nameLabel = UILabel(frame: CGRect(x: 6, y: -15, width: 150, height: 100))
            infoLabel = UILabel(frame: CGRect(x: 15, y: 40, width: self.frame.width/2.1, height: 270))
            infoLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        }
    
        infoLabel.text = "NOLO is a campaign developed by teens, for teens, that strides to spread awareness and knowledge of the causes and impacts of insufficient sleep. NOLO’s ultimate goal is to make sleep a priority amongst teenagers."
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        infoLabel.textColor = .black
        infoLabel.textAlignment = NSTextAlignment.left
        websiteIconNode = self.childNode(withName: "WebsiteIcon") as! SKSpriteNode
        
        twitterButtonNode = self.childNode(withName: "TwitterNode") as! SKSpriteNode
        twitterButtonNode.texture = SKTexture(imageNamed: "TwitterIcon")
        twitterButtonNode.color = .clear
        
        snapchatButtonNode = self.childNode(withName: "SnapchatNode") as! SKSpriteNode
        snapchatButtonNode.texture = SKTexture(imageNamed: "SnapchatIcon")
        snapchatButtonNode.color = .clear
        
        instagramButtonNode = self.childNode(withName: "InstagramNode") as! SKSpriteNode
        instagramButtonNode.texture = SKTexture(imageNamed: "InstagramIcon")
        instagramButtonNode.color = .clear
        
        facebookButtonNode = self.childNode(withName: "FacebookNode") as! SKSpriteNode
        facebookButtonNode.texture = SKTexture(imageNamed: "FacebookIcon")
        facebookButtonNode.color = .clear
        
        let name = String(welcomeScene.getName())
        if(name!.characters.count >= 25)
        {
            nameLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 10)
        } else if(name!.characters.count >= 20){
            nameLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 12)
        } else if(name!.characters.count >= 15){
            nameLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 14)
        } else if(name!.characters.count >= 10){
            nameLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 16)
        } else {
            nameLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 18)
        }
        
        nameLabel.attributedText = NSAttributedString(string: name!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        nameLabel.textAlignment = NSTextAlignment.left

        self.view?.addSubview(nameLabel)
        self.view?.addSubview(infoLabel)
    }
    override func update(_ currentTime: TimeInterval) {
        playViewController.checkNameLabel(namelabel: nameLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "WebsiteNode" {
                websiteIconNode.scale(to: CGSize(width: 310, height: 90))
            }
            if nodesArray.first?.name == "TwitterNode" {
                twitterButtonNode.scale(to: CGSize(width: 90, height: 90))
            }
            if nodesArray.first?.name == "SnapchatNode" {
                snapchatButtonNode.scale(to: CGSize(width: 90, height: 90))
            }
            if nodesArray.first?.name == "InstagramNode" {
                instagramButtonNode.scale(to: CGSize(width: 90, height: 90))
            }
            if nodesArray.first?.name == "FacebookNode" {
                facebookButtonNode.scale(to: CGSize(width: 90, height: 90))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "WebsiteNode" {
                websiteIconNode.scale(to: CGSize(width: 344, height: 100))
            }
            if nodesArray.first?.name == "TwitterNode" {
                twitterButtonNode.scale(to: CGSize(width: 100, height: 100))
            }
            if nodesArray.first?.name == "SnapchatNode" {
                snapchatButtonNode.scale(to: CGSize(width: 100, height: 100))
            }
            if nodesArray.first?.name == "InstagramNode" {
                instagramButtonNode.scale(to: CGSize(width: 100, height: 100))
            }
            if nodesArray.first?.name == "FacebookNode" {
                facebookButtonNode.scale(to: CGSize(width: 100, height: 100))
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "WebsiteNode"{
                websiteIconNode.scale(to: CGSize(width: 344, height: 100))
                //if let website = NSURL(string: "http://nolo716.org"){
                 //   UIApplication.shared.open(website as URL, options: [:], completionHandler: nil)
                //}
                if let vc = self.view?.window?.rootViewController{
                    let safariVC = SFSafariViewController(url: NSURL(string: "http://nolo716.org")! as URL)
                    vc.present(safariVC, animated: true, completion: nil)
                    safariVC.delegate = self as? SFSafariViewControllerDelegate
                }
                
            }
            if nodesArray.first?.name == "TwitterNode"{
                twitterButtonNode.scale(to: CGSize(width: 100, height: 100))
                gameViewController.socialMediaLink(appLink: "twitter://user?screen_name=@NOLO716", webLink: "https://twitter.com/@NOLO716")
            }
            if nodesArray.first?.name == "SnapchatNode"{
                snapchatButtonNode.scale(to: CGSize(width: 100, height: 100))
                gameViewController.socialMediaLink(appLink: "snapchat://add/nolo716", webLink: "itms-apps://itunes.apple.com/app/snapchat/id447188370?mt=8")
            }
            if nodesArray.first?.name == "InstagramNode"{
                instagramButtonNode.scale(to: CGSize(width: 100, height: 100))
                gameViewController.socialMediaLink(appLink: "Instagram://user?username=NOLO716", webLink: "itms-apps://itunes.apple.com/app/instagram/id389801252?mt=8")
            }
            if nodesArray.first?.name == "FacebookNode"{
                facebookButtonNode.scale(to: CGSize(width: 100, height: 100))
                gameViewController.socialMediaLink(appLink: "fb://profile/347809602305230", webLink: "https://www.facebook.com/Nightz-Out-Lightz-out-347809602305230/")
                
            }
        }
    }
}
