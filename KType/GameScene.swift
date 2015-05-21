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
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        /* <<< NEW TUTORIAL CODE MAY 11 >>> */
        if let destintation = touches.first as? UITouch {
            playerShip.touchPoint = destintation
            playerShip.travelling = true
        }
        /* <<< NEW TUTORIAL CODE MAY 11 >>> */
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        playerShip.travelling = false
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        /* <<< NEW TUTORIAL CODE MAY 11 >>> */
        playerShip.update(currentTime)
        /* <<< NEW TUTORIAL CODE MAY 11 >>> */
        
    }
    
    func loadStarField() {
        let starField = KGStarFieldNode()
        self.addChild(starField)
        starField.beginSpawningStars()
    }
    
    /* <<< NEW TUTORIAL CODE MAY 11 >>> */
    func loadPlayerShip() {
        self.addChild(playerShip)
    }
    
    lazy var playerShip: KGPlayerShipNode = {
        let shipNode = KGPlayerShipNode()
        shipNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        shipNode.name = "PlayerShip"
        return shipNode
    }()
    /* <<< NEW TUTORIAL CODE MAY 11 >>> */
    
}
