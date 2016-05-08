//
//  MLwall.swift
//  1dd
//
//  Created by Ahmed Masoud on 6/19/15.
//  Copyright (c) 2015 Ahmed Masoud. All rights reserved.
//

import Foundation
import SpriteKit
class MLwall: SKSpriteNode {
    var wallwidth :CGFloat = 20
    var wallheight :CGFloat = 20
    //let wallcolor = UIColor(red: 159/255, green: 201/255, blue: 244/255, alpha: 1)
    let wallcolor = UIColor.blackColor()
    init(){
        super.init(texture: nil, color: wallcolor, size: CGSizeMake(wallwidth, wallheight))
        loadphysicsbodywhithsize(size)
        //startmoving(1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadphysicsbodywhithsize(size1: CGSize){
        physicsBody = SKPhysicsBody(rectangleOfSize: size1)
        physicsBody?.categoryBitMask = wallcategory
        physicsBody?.affectedByGravity = false
    }
    
    func startmoving(time :NSTimeInterval , speed :CGFloat ){
        
        let moveleft = SKAction.moveByX(speed, y: 0, duration: time)
        runAction(SKAction.repeatActionForever(moveleft))
    }
    func stopmoving(){
        removeAllActions()
    }
}
