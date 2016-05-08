//
//  MLPointsLabel.swift
//  ninja-run
//
//  Created by Ahmed masoud on 11/2/15.
//  Copyright © 2015 Ahmed masoud. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class MLPointsLabel: SKLabelNode {
    var number = 0
    init(num :Int) {
        super.init()
        fontColor = UIColor.whiteColor()
        fontName = "Helvetica"
        fontSize = 20.0
        
        
        number = num
        text = "\(num)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func increment(){
        number++
        text = "\(number)"
        
    }
    func setto(num:Int){
        self.number=num
        self.text = "\(self.number)"
        
        
    }
}
