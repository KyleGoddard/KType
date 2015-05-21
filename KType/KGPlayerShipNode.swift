//
//  KGPlayerShipNode.swift
//  KType
//
//  Created by Kyle Goddard on 2015-03-26.
//  Copyright (c) 2015 Kyle Goddard. All rights reserved.
//

import SpriteKit

class KGPlayerShipNode: SKSpriteNode {
    
    /* <<< NEW TUTORIAL MAY 11 >>>> */
//    var touchPoint: CGPoint?
    var touchPoint: UITouch?
    var lastInterval: CFTimeInterval?
    var travelling: Bool
    /* <<< NEW TUTORIAL MAY 11 >>>> */
    
    let defaultScale:CGFloat = 0.5
    let defaultTextureName = "SpaceFighter"
    let defaultSize:CGSize = CGSize(width: 200.0, height: 53.0)
    let brakeDistance:CGFloat = 4.0
    
    //new
    let defaultShipSpeed = 250;
    
    init() {
        
        let texture = SKTexture(imageNamed: defaultTextureName)
        let color = UIColor.redColor()
        let size = defaultSize
        
        travelling = false
        
        super.init(texture: texture, color: color, size: size)

        loadDefaultParams()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDefaultParams() {
        self.xScale = defaultScale
        self.yScale = defaultScale
    }
    
    /* <<< NEW TUTORIAL MAY 11 >>>> */
    
    func travelTowardsPoint(point: CGPoint, byTimeDelta timeDelta: NSTimeInterval) {
        var shipSpeed = defaultShipSpeed
        
        var distanceLeft = sqrt(pow(position.x - point.x, 2) + pow(position.y - point.y, 2))
        
        if (distanceLeft > brakeDistance) {
            var distanceToTravel = CGFloat(timeDelta) * CGFloat(shipSpeed)
            var angle = atan2(point.y - position.y, point.x - position.x)
            var yOffset = distanceToTravel * sin(angle)
            var xOffset = distanceToTravel * cos(angle)
            
            position = CGPointMake(position.x + xOffset, position.y + yOffset)
        }
    }
    
    func update(interval: CFTimeInterval) {
        
        if lastInterval == nil {
            lastInterval = interval
        }
        
        var delta: CFTimeInterval = interval - lastInterval!
        
        if (travelling) {
            if let destination = touchPoint?.locationInNode(scene as? GameScene) {
                travelTowardsPoint(destination, byTimeDelta: delta)
            }
        }
        lastInterval = interval
    }
    
    /* <<< NEW TUTORIAL MAY 11 >>>> */
    
}
