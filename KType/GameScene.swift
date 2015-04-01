//
//  GameScene.swift
//  KType
//
//  Created by Kyle Goddard on 2015-03-16.
//  Copyright (c) 2015 Kyle Goddard. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = SKColor.blackColor()
        
        loadStarField()
        loadPlayerShip()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func loadStarField() {
        let starField = KGStarFieldNode()
        self.addChild(starField)
        starField.beginSpawningStars()
    }
    
    func loadPlayerShip() {
        let playerShip = KGPlayerShipNode()
        playerShip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(playerShip)
    }
}
