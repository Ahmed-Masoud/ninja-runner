//
//  MLwallgenerator.swift
//  1dd
//
//  Created by Ahmed Masoud on 6/19/15.
//  Copyright (c) 2015 Ahmed Masoud. All rights reserved.
//

import Foundation
import SpriteKit
class MLwallgenerator : SKSpriteNode {
    var generationtimer :NSTimer?
    var walls = [MLwall]()
    func startgeneratingwallasevery(seconds : NSTimeInterval,code:Int){
        if (code == 1){
            generationtimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generatewall", userInfo: nil, repeats: true)}
        else if (code == 2)
        {
            generationtimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generatewall2", userInfo: nil, repeats: true)
        }
        else if(code == 3){
            generationtimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generatewall3", userInfo: nil, repeats: true)
            
        }
    }
    func generatewall(){
        let wall = MLwall()
        wall.position.x = size.width/2 + wall.size.width/2
        // wall.position.y = KMLGroundheight/2 + wall.size.height/2 - 2
        wall.position.y = 70
        walls.append(wall)
        addChild(wall)
        wall.startmoving(1,speed: wallspeed)
        wall.physicsBody?.affectedByGravity = false
    }
    func generatewall3(){
        let wall = MLwall()
        
        wall.position.x = frame.size.width

        wall.position.y = CGFloat(arc4random_uniform(UInt32(300 - -80 + 1))) +   -80
        walls.append(wall)
        addChild(wall)
        wall.startmoving(0.3,speed: wallspeed+20)
        wall.physicsBody?.affectedByGravity = false
        
    }
    func generatewall2(){
        let wall = MLwall()
        //wall.position.x = size.width/2 + wall.size.width/2
        // wall.position.x = CGFloat(arc4random_uniform(UInt32(300)))
        //wall.position.x = CGFloat(arc4random_uniform(UInt32(frame.size.width - 100))) + CGFloat(100)
        wall.position.x = CGFloat(arc4random_uniform(UInt32(250 - -200 + 1))) +   -200
        
        
        
        // wall.position.y = KMLGroundheight/2 + wall.size.height/2 - 2
        wall.position.y = frame.size.height/2 + 20
        walls.append(wall)
        addChild(wall)
        wall.startmoving(1,speed: -100)
        let bibo = wallspeed
        wall.physicsBody?.affectedByGravity = true
        //wall.physicsBody?.applyImpulse(CGVector(dx: -5, dy: -1))
    }
    func stopwalls(){
        generationtimer?.invalidate()
        for wall in walls {
            wall.stopmoving()
            wall.physicsBody?.affectedByGravity = true
        }
    }
    func removewalls(){
        for wall in walls{
            if (wall.position.y < -30)
            {
                wall.removeFromParent()
            }
        }
    }
    /* func startmoving(speed :NSTimeInterval) -> (Int , Bool){
    if z%5==0{
    wallspeed-=0.5
    let moveleft = SKAction.moveByX(wallspeed, y: 0, duration: speed)
    runAction(SKAction.repeatAction(moveleft, count: 5))
    return (z,true)
    } else if z==0 {
    let moveleft = SKAction.moveByX(wallspeed, y: 0, duration: speed)
    runAction(SKAction.repeatAction(moveleft, count: 5))
    return (z,false)
    }
    return (z,false)
    }*/
}
