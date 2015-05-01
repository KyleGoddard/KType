//
//  KGPlayerShipNode.swift
//  KType
//
//  Created by Kyle Goddard on 2015-03-26.
//  Copyright (c) 2015 Kyle Goddard. All rights reserved.
//

import SpriteKit

class KGPlayerShipNode: SKSpriteNode {
    
    let defaultScale:CGFloat = 0.5
    let defaultTextureName = "SpaceFighter"
    let defaultSize:CGSize = CGSize(width: 200.0, height: 53.0)
    
    //new
    let defaultShipSpeed = 100;
    
    init() {
        
        let texture = SKTexture(imageNamed: defaultTextureName)
        let color = UIColor.redColor()
        let size = defaultSize
        
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
    
}
