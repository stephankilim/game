//
//  GameScene.swift
//  myGame
//
//  Created by UCode on 1/26/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import SpriteKit
let BlockSize: CGFloat = 20.0
//#1
let TickLengthLevelOne = TimeInterval(600)
class GameScene: SKScene {
    let gameLayer = SKNode()
    let shapeLayer = SKNode()
    let LayerPosition = CGPoint(x: 6, y: -6)
    //#2
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    var textureCache = Dictionary<String, SKTexture>()
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
    addChild(gameLayer)
        
    let gameBoardTexture = SKTexture(imageNamed: "gameboard")
        let dimension = CGSize(width: BlockSize * CGFloat(NumColumns), height: BlockSize * CGFloat(NumRows))
    let gameBoard = SKSpriteNode(texture: gameBoardTexture, size: dimension)
        
        
        gameBoard.anchorPoint = CGPoint(x: 0, y: 1.0)
        gameBoard.position = LayerPosition
        
        shapeLayer.position = LayerPosition
        shapeLayer.addChild(gameBoard)
        gameLayer.addChild(shapeLayer)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        guard let lastTick = lastTick else {
            return
        }
        let timePassed = lastTick.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            self.lastTick = NSDate()
            tick?()
        }
    }
    func startTicking() {
        lastTick = NSDate()
        
    }
    func stopTIcking() {
        lastTick = nil
    }
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        let x = LayerPosition.x + (CGFloat(column) * BlockSize) + (BlockSize/2)
        let y = LayerPosition.y - ((CGFloat(row) * BlockSize) + (BlockSize/2))
        return CGPointMake(x, y)
    }
    func addPreviewShapeToScene(shape:Shape, completion:() -> ()) {
        for block in shape.blocks {
            
            var texture = textureCache[block.spriteName]
            if texture == nil {
                texture = SKTexture(imageNamed: block.spriteName)
                textureCache[block.spriteName] = texture
           }
            let sprite = SKSpriteNode(texture: texture)
       
            sprite.position = pointForColumn(column: block.column, row: block.row - 2)
        shapeLayer.addChild(sprite)
            block.sprite = sprite
            
            //animation
            sprite.alpha = 0
        }
        
}
}

