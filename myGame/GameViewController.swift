//
//  GameViewController.swift
//  myGame
//
//  Created by UCode on 1/26/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    var swiftris:Swiftris!
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
    //configure the view
     let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        //create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        scene.tick = didTick
        
        swiftris = Swiftris()
        swiftris.beginGame()
        
//present the scene
    skView.presentScene(scene)
        scene.addPreviewShapeToScene(shape: swiftris.nextShape!) {
            self.swiftris.nextShape?.moveTo(column: StartingColumn, row: StartingRow)
            self.scene.movePreviewShape(shape: self.swiftris.nextShape!) {
                let nextShapes = self.swiftris.newShape()
                self.scene.startTicking()
                self.scene.addPreviewShapeToScene(shape: nextShapes.nextShape!) {}
            }
            
        }
        
        
}
func didTick() {
    swiftris.fallingShape?.lowerShapeByOneRow()
    scene.redrawShape(shape: swiftris.fallingShape!, completion: {})
}
}
