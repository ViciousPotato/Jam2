//
//  GameScene.swift
//  Jam2
//
//  Created by zhou on 14-6-5.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        let reveal = SKTransition.revealWithDirection(.Left, duration: 1.0)
        let s1 = Scene1.sceneWithSize(self.view.bounds.size)
        self.scene.view.presentScene(s1, transition: reveal)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
