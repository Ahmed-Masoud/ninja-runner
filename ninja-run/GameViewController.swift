//
//  GameViewController.swift
//  1dd
//
//  Created by Ahmed Masoud on 6/18/15.
//  Copyright (c) 2015 Ahmed Masoud. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    var scene : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //configure the view:
        let skview = view as! SKView
        skview.multipleTouchEnabled = false
        //configure the scene
        scene = GameScene(size: skview.bounds.size)
        scene.scaleMode = .AspectFill
        //present the scene
        skview.presentScene(scene)
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        let orientation: UIInterfaceOrientationMask = [UIInterfaceOrientationMask.LandscapeLeft, UIInterfaceOrientationMask.LandscapeRight]
        return orientation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
