//
//  GameScene.swift
//  myGame
//
//  Created by UCode on 1/26/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import SpriteKit
//#1
let TickLengthLevelOne = TimeInterval(600)
class GameScene: SKScene {
    
    //#2
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    override init(size: CGSize) {
        super.init(size: size)
    
    anchorPoint = CGPoint(x: 0, y: 1.0)
    
    let background = SKSpriteNode(imageNamed: "background")
    background.position = CGPoint(x: 0, y: 0)
    background.anchorPoint = CGPoint(x: 0, y: 1.0)
    addChild(background)
}override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }


}
