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
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
    //configure the view
     let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        //create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
//present the scene
    skView.presentScene(scene)
    
    }
   
    

}

