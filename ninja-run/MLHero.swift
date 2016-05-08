//
//  MLHero.swift
//  1dd
//
//  Created by Ahmed Masoud on 6/19/15.
//  Copyright (c) 2015 Ahmed Masoud. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class MLHero:SKSpriteNode{
    var body : SKSpriteNode!
    var arm : SKSpriteNode!
    var leftfoot : SKSpriteNode!
    var rightfoot : SKSpriteNode!
    
    init() {
        let size1 = CGSize(width: 32, height: 44)
        super.init(texture: nil, color: UIColor.clearColor(), size: size1)
        loadAppearance()
        loadphysicsbodywhithsize(size1)
        
        
        
    }
    
    
    func loadphysicsbodywhithsize(size1: CGSize){
        physicsBody = SKPhysicsBody(rectangleOfSize: size1)
        physicsBody?.categoryBitMask = herocategory
        physicsBody?.contactTestBitMask = wallcategory
        physicsBody?.affectedByGravity = false
    }
    
    
    
    func loadAppearance(){
        body = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.size.width, 40))
        body.position = CGPointMake(0, 9)
        addChild(body)
        
        let skincolor = UIColor(red: 207/255, green: 193/255, blue: 168/255, alpha: 1)
        let face = SKSpriteNode(color: skincolor, size: CGSizeMake(self.frame.size.width, 12))
        face.position = CGPointMake(0, 6)
        body.addChild(face)
        /* stick man :)
        body = SKSpriteNode(imageNamed: "hero.jpg")
        body.size = CGSizeMake(self.frame.size.width, 70)
        
        addChild(body)
        arm = SKSpriteNode(imageNamed: "images.png")
        arm.position = CGPointMake(CGFloat(random()%500), 2)
        addChild(arm);*/
        let eyecolor = UIColor.whiteColor()
        let lefteye = SKSpriteNode(color: eyecolor, size: CGSizeMake(6, 6))
        let righteye = lefteye.copy() as! SKSpriteNode
        let pupil = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(3, 3))
        pupil.position = CGPointMake(0, 1)
        lefteye.addChild(pupil)
        righteye.addChild(pupil.copy() as! SKSpriteNode)
        lefteye.position = CGPointMake(-2, 0)
        face.addChild(lefteye)
        
        righteye.position = CGPointMake(12, 0)
        face.addChild(righteye)
        
        let eyebraws = SKSpriteNode(color: UIColor.brownColor(), size: CGSizeMake(5, 1))
        eyebraws.position = CGPointMake(-2, lefteye.size.height / 1.5)
        face.addChild(eyebraws)
        let eyebraw2 = eyebraws.copy() as! SKSpriteNode
        eyebraw2.position = CGPointMake(12, righteye.size.height / 1.5)
        face.addChild(eyebraw2)
        
        let armcolor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1.0)
        arm = SKSpriteNode(color: armcolor, size: CGSizeMake(8, 14))
        arm.anchorPoint = CGPointMake(0.5, 0.9)
        arm.position = CGPointMake(-10, -7)
        body.addChild(arm)
        
        let hand = SKSpriteNode(color: skincolor, size: CGSizeMake(arm.size.width, 5))
        hand.position = CGPointMake(0, -arm.size.height * 0.9 + hand.size.height + 0.9)
        arm.addChild(hand)
        
        leftfoot = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(9, 11))
        leftfoot.position = CGPointMake(-6, -25)
        //leftfoot.anchorPoint = CGPointMake(0.5, 0.9)
        body.addChild(leftfoot)
        
        rightfoot = leftfoot.copy() as! SKSpriteNode
        rightfoot.position.x = 8
        body.addChild(rightfoot)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stop(){
        body.removeAllActions()
        leftfoot.removeAllActions()
        rightfoot.removeAllActions()
        arm.removeAllActions()
    }
    func breathe(){
        let breathout = SKAction.moveByX(0, y: -2, duration: 1)
        let breathin = SKAction.moveByX(0, y: 2, duration: 1)
        let breath = SKAction.sequence([breathout,breathin])
        let antibreath = SKAction.sequence([breathin,breathout])
        
        body.runAction(SKAction.repeatActionForever(breath))
        let antibreathout = SKAction.moveByX(0, y: 2, duration: 1)
        let antibreathin = SKAction.moveByX(0, y: -2, duration: 1)
        self.leftfoot.runAction(SKAction.repeatActionForever(antibreath))
        self.rightfoot.runAction(SKAction.repeatActionForever(antibreath))
        //rightfoot.removeAllActions()
    }
    func start_running(){
        let rotateback = SKAction.rotateByAngle(-CGFloat(M_PI)/2.0, duration: 0.1)
        //arm.runAction(rotateback)
        arm_rtt()
        performoneruncycle()
    }
    //angel run
    /* func performoneruncycle(){
    let up = SKAction.rotateByAngle(CGFloat(M_PI)/4, duration: 0.05)
    let down = SKAction.rotateByAngle(-CGFloat(M_PI)/4, duration: 0.05)
    leftfoot.runAction(up, completion: { () -> Void in
    self.leftfoot.runAction(down)
    self.rightfoot.runAction(up, completion: { () -> Void in
    self.rightfoot.runAction(down, completion: { () -> Void in
    self.performoneruncycle()
    })
    })
    })
    }*/
    
    
    
    //jump run
    func performoneruncycle(){
        let up = SKAction.moveByX(0, y: 4, duration: 0.05)
        let down = SKAction.moveByX(0, y: -4, duration: 0.05)
        leftfoot.runAction(up, completion: { () -> Void in
            self.leftfoot.runAction(down)
            self.rightfoot.runAction(up, completion: { () -> Void in
                self.rightfoot.runAction(down, completion: { () -> Void in
                    self.performoneruncycle()
                })
            })
        })
    }
    func arm_rtt(){
        let rotateback = SKAction.rotateByAngle(-CGFloat(M_PI)/2.0, duration: 0.2)
        let rotatefwd = SKAction.rotateByAngle(CGFloat(M_PI)/2.0, duration: 0.2)
        arm.runAction(rotateback, completion: { () -> Void in
            self.arm.runAction(rotatefwd, completion: { () -> Void in
                self.arm_rtt()
            })
        })}
    
    func rotateanimation(){
        let elev = SKAction.rotateByAngle(-CGFloat(2*M_PI), duration: 0.3)
        body.runAction(elev)
        //leftfoot.runAction(elev, completion: nil)
        //rightfoot.runAction(elev, completion: nil)
    }
    func fall(code : Int){
        if(code == 1){
            physicsBody?.applyImpulse(CGVectorMake(-5, 30))
        }else{
            physicsBody?.applyImpulse(CGVector(dx: -5, dy: 8))
        }
        physicsBody?.affectedByGravity=true
        
        
        let rotateback = SKAction.rotateByAngle(CGFloat(M_PI) / 2, duration: 0.4)
        runAction(rotateback)
    }
    
    func stop_running(){
        leftfoot.removeAllActions()
        rightfoot.removeAllActions()
        leftfoot.position = CGPointMake(-6, -25)
        rightfoot.position = CGPointMake(8, -25)
    }
    
    
    
    
    
}
