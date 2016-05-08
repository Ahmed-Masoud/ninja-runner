//
//  GameScene.swift
//  1dd
//
//  Created by Ahmed Masoud on 6/18/15.
//  Copyright (c) 2015 Ahmed Masoud. All rights reserved.
//

import SpriteKit
var z=0
class GameScene: SKScene,SKPhysicsContactDelegate {
    var movingground : MLMovingGround!
    var hero : MLHero!
    var score : MLPointsLabel!
    var game_start = false
    //var cloudgenerator : MLcloudgenerator!
    var wallgenerator : MLwallgenerator!
    var isgameover = false
    override func didMoveToView(view: SKView) {
        backgroundColor=UIColor(red: 159/255, green: 201/255, blue: 244/255, alpha: 1)
        // let backgroundtexture = SKTexture(imageNamed: "back.jpg")
        //let backgroundimage = SKSpriteNode(texture: backgroundtexture, size: view.frame.size)
        //backgroundimage.position = view.center
        //addChild(backgroundimage)
        //add ground
        movingground = MLMovingGround(size: CGSizeMake(view.frame.width+300, 4))
        movingground.position = CGPointMake(0, view.frame.size.height/2)
        addChild(movingground)
        //add hero
        hero = MLHero()
        hero.position = CGPointMake(70, movingground.position.y + movingground.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        //hero breath
        hero.breathe()
        /*clouds generation
        cloudgenerator = MLcloudgenerator(color: UIColor.clearColor(), size: frame.size)
        cloudgenerator.position = view.center
        addChild(cloudgenerator)
        cloudgenerator.populate(7)*/
        
        //add wall
        wallgenerator = MLwallgenerator(color: UIColor.clearColor(), size: view.frame.size)
        wallgenerator.position = view.center
        wallgenerator.position.y = 150;
        addChild(wallgenerator)
        
        //start screen
        
        let taptostartlabel = SKLabelNode(text: "Tap To Start !!");
        taptostartlabel.name = "taptostartlabel"
        taptostartlabel.fontSize = 20
        taptostartlabel.fontName = "helvetica"
        taptostartlabel.position = view.center
        taptostartlabel.position.y = 220
        
        taptostartlabel.fontColor = UIColor.blackColor()
        addChild(taptostartlabel)
        
        //add physics world :D
        loadscore();
        
        physicsWorld.contactDelegate = self
        
        
        
        
    }
    
    //score function
    
    func loadscore(){
        let defaults = NSUserDefaults.standardUserDefaults()
        score = MLPointsLabel(num: defaults.integerForKey("highscore"))
        score.position.y = frame.size.height - 30
        score.position.x = frame.size.width / 2
        score.name = "PointsLabel"
        addChild(score)
        let highscorelabel = childNodeWithName("PointsLabel") as! MLPointsLabel
        
        
        
    }
    
    
    //game over label
    func gameoverlabel(){
        
        let gameoverlabel = SKLabelNode(text: "Game Over !!");
        gameoverlabel.name = "taptostartlabel"
        gameoverlabel.fontSize = 20
        gameoverlabel.fontName = "helvetica"
        gameoverlabel.position.x = 300
        //gameoverlabel.position = view?.center
        gameoverlabel.position.y = 220
        
        gameoverlabel.fontColor = UIColor.blackColor()
        addChild(gameoverlabel)
        
    }
    
    //what happens when contact happens
    
    func gameover(){
        
        isgameover = true
        
        // hero.physicsBody?.affectedByGravity=true
        if (jump == true){
            hero.fall(1)}
        else{
            hero.fall(2)}
        jump = true
        wallgenerator.stopwalls()
        movingground.stop()
        hero.stop()
        gameoverlabel()
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        self.gameover()
        game_start = false
        
    }
    func restart(){
        let newscene = GameScene(size: view!.bounds.size)
        newscene.scaleMode = .AspectFill
        view?.presentScene(newscene)
        
    }
    func level2(){
        jump = true
        backgroundColor = UIColor.whiteColor()
        wallgenerator.stopwalls()
        wallspeed=wallspeed - 100
        wallgenerator.startgeneratingwallasevery(0.7,code: 1)
        let level_2 = SKLabelNode(text: "level 2 !!");
        level_2.name = "level 2 !!"
        level_2.fontSize = 20
        level_2.position.x = 300
        level_2.position.y = 220
        level_2.fontName = "helvetica"
        level_2.fontColor = UIColor.blackColor()
        addChild(level_2)
        
        let seconds = 1.1
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            // here code perfomed with delay
            let newlevellabel = self.childNodeWithName("level 2 !!")
            newlevellabel?.removeFromParent()
            
        })
        
    }
    func level3(){
        jump = false
        hero.stop_running()
        backgroundColor = UIColor.brownColor()
        wallgenerator.stopwalls()
        // wallspeed=wallspeed - 500
        wallgenerator.startgeneratingwallasevery(0.3,code : 2)
        let move_ground_down = SKAction.moveByX(0, y: -frame.size.height/4, duration: 2)
        movingground.runAction(move_ground_down)
        hero.runAction(move_ground_down)
        
        let level_3 = SKLabelNode(text: "level 3 !!");
        level_3.name = "level 3 !!"
        level_3.fontSize = 20
        level_3.position.x = 300
        level_3.position.y = 220
        level_3.fontName = "helvetica"
        level_3.fontColor = UIColor.blackColor()
        addChild(level_3)
        
        let seconds = 1.1
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            // here code perfomed with delay
            let newlevellabel = self.childNodeWithName("level 3 !!")
            newlevellabel?.removeFromParent()
            
        })
        
    }
    func level4(){
        jump = false
        hero.stop_running()
        hero.position = CGPointMake(70, movingground.position.y + movingground.frame.size.height / 2 + hero.frame.size.height / 2)
        backgroundColor = UIColor.brownColor()
        wallgenerator.stopwalls()
        
        // wallspeed=wallspeed - 500
        wallgenerator.startgeneratingwallasevery(0.3,code : 3)
        movingground.removeFromParent();
        
        
        let level_4 = SKLabelNode(text: "level 4 !!");
        level_4.name = "level 4 !!"
        level_4.fontSize = 20
        level_4.position.x = 300
        level_4.position.y = 220
        level_4.fontName = "helvetica"
        level_4.fontColor = UIColor.blackColor()
        addChild(level_4)
        
        let seconds = 1.1
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            // here code perfomed with delay
            let newlevellabel = self.childNodeWithName("level 4 !!")
            newlevellabel?.removeFromParent()
            
        })
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        game_start = true
        
        
        if(i==0){
            i++;
            movingground.start(700)
            hero.start_running()
            wallgenerator.startgeneratingwallasevery(1,code : 1)
            
            
            
            let taptostartlabel = childNodeWithName("taptostartlabel")
            taptostartlabel?.removeFromParent()
            
        }else if (!isgameover && jump == true){
            
            
            hero.rotateanimation()
            z++
            level = z/10
            if z%10 == 0 && z/10 == 1 {
                
                level2()
            }
            if z%10 == 0 && z/10 == 2 {
                level = 3
                level3()
                let seconds = 10.0
                let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
                let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                
                
                dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                    
                    // here code perfomed with delay
                    level = 4
                    self.level4();
                    
                })
                
            }
            if z%10 == 0 && z/10 == 3 {
                level4()
            }
            var x:Double = 0
            
            let upjump = SKAction.moveByX(0, y: 100, duration: 0.2)
            let downjump = SKAction.moveByX(0, y: -100, duration: 0.2)
            hero.runAction(upjump, completion: { () -> Void in
                self.hero.runAction(downjump)
                
            })
            
            /*for x=0;x<=70;x++
            {
            self.hero.position = CGPointMake(self.hero.position.x,self.hero.position.y + 0.1 )
            }*/
            
            
            let seconds = 0.25
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                
                // here code perfomed with delay
                for x=0;x<=70;x++
                {
                    // self.hero.position = CGPointMake(self.hero.position.x,self.hero.position.y - 1 )
                    continue
                }
                
            })
            
        }else if(jump == false){
            hero.start_running()
        }
        else{
            z=0
            i=0
            level = 1
            wallspeed = -KdefaultXtoMovePerSecond
            restart()
        }
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(jump == false && level == 4){
            let touch = touches.first
            let touchLoc = touch!.locationInNode(self)
            let prevTouchLoc = touch!.previousLocationInNode(self)
            var newYPos = hero.position.y + (touchLoc.y - prevTouchLoc.y)
            newYPos = max(newYPos, hero.size.width / 2)
            newYPos = min(newYPos, self.size.width - hero.size.width / 2)
            hero.position = CGPointMake(hero.position.x,newYPos )
        }
        
        if(jump == false && level == 3){
            let touch = touches.first
            let touchLoc = touch!.locationInNode(self)
            let prevTouchLoc = touch!.previousLocationInNode(self)
            var newXPos = hero.position.x + (touchLoc.x - prevTouchLoc.x)
            newXPos = max(newXPos, hero.size.width / 2)
            newXPos = min(newXPos, self.size.width - hero.size.width / 2)
            hero.position = CGPointMake(newXPos,hero.position.y )
        }
        
    }
    
    //override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        if (jump == false){
            hero.stop_running()
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //score.increment()
        /*if(isgameover==false && game_start==true){
        score.increment()
        }*/
        if (isgameover==false){
            score.increment()}
        if (jump == false){
            
            wallgenerator.removewalls()
            
        }
    }
}
