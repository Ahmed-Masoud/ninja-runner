//
//  MLmovingground.swift
//  1dd
//
//  Created by Ahmed Masoud on 6/18/15.
//  Copyright (c) 2015 Ahmed Masoud. All rights reserved.
//

import Foundation
import SpriteKit
class MLMovingGround : SKSpriteNode{
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor.blackColor()
    let COLOR_TWO  = UIColor.grayColor()
    init(size: CGSize){
        super.init(texture: nil, color: UIColor.blackColor(), size: CGSizeMake(size.width*2, size.height))
        anchorPoint = CGPointMake(0, 0.5)
        for var i = 0 ; i<NUMBER_OF_SEGMENTS ; i++
        {
            var segmentcolor : UIColor!
            if (i%2==0){
                segmentcolor=COLOR_ONE
            }else{
                segmentcolor=COLOR_TWO
                
            }
            let segment = SKSpriteNode(color: segmentcolor, size: CGSizeMake(self.size.width / CGFloat(NUMBER_OF_SEGMENTS), self.size.height))
            segment.anchorPoint = CGPointMake(0, 0.5);
            segment.position = CGPointMake(CGFloat(i)*segment.size.width, 0)
            addChild(segment);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start(s : CGFloat){
        let adjustedDuration = NSTimeInterval( self.frame.size.width/KdefaultXtoMovePerSecond)
        let moveleft = SKAction.moveByX(-1000, y: 0, duration: adjustedDuration/4)
        let resetposition = SKAction.moveToX(0, duration: 0)

        let movesequence = SKAction.sequence([moveleft,resetposition])
        runAction(SKAction.repeatActionForever(movesequence))
    }
    func stop(){
        removeAllActions()
    }
    
    
}