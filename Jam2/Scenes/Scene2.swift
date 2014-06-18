//
//  Scene2.swift
//  Jam2
//
//  Created by zhou on 14-6-17.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit

class Scene2 : SKScene {
    override func didMoveToView(view: SKView) {
        let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

        let background = SKSpriteNode(imageNamed: "Scene1.bg")
        background.position = centerPos
        self.addChild(background)
    }
}
