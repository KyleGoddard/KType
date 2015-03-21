//
//  KGStarFieldNode.swift
//  KType
//
//  Created by Kyle Goddard on 2015-03-17.
//  Copyright (c) 2015 Kyle Goddard. All rights reserved.
//

import SpriteKit

let baseAlpha: CGFloat = 0.1
let baseDuration: CGFloat = 0.5
let defaultDelay: NSTimeInterval = 0.03
let starSize = CGSizeMake(15.0, 5.0)

class KGStarFieldNode: SKNode {
    
    internal func beginSpawningStars() {
        let update = SKAction.runBlock {
            [unowned self] in
            self.spawnStar()
        }
        let delay = SKAction.waitForDuration(defaultDelay)
        let updateSequence = SKAction.sequence([delay, update])
        let repeatForever = SKAction.repeatActionForever(updateSequence)
        
        self.runAction(repeatForever)
    }
    
    private func spawnStar() {
        if let gameScene = self.scene {
            
            let randomPositionY = CGFloat(arc4random_uniform( UInt32(gameScene.size.height)))
            let maxPositionX = CGRectGetMaxX(gameScene.frame)
            let spawnPoint = CGPointMake(maxPositionX, randomPositionY)
            
            let starNode = SKSpriteNode(imageNamed: "Star")
            starNode.position = spawnPoint
            starNode.size = starSize
            starNode.alpha = baseAlpha + CGFloat(Double(arc4random_uniform(10)) / 10.0)
            
            self.addChild(starNode)
            
            let destinationX = 0 - CGRectGetWidth(gameScene.frame) - starSize.width
            let duration = NSTimeInterval(baseDuration + CGFloat(Double(arc4random_uniform(10)) / 10.0))
            
            let travel = SKAction.moveByX(destinationX, y:0.0, duration: duration)
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([travel, remove])
            
            starNode.runAction(sequence)
            
        }
    }
   
}
