//
//  Scene1.swift
//  Jam2
//
//  Created by zhou on 14-6-7.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit

class Scene1 : SKScene {
  var _clickableAnimationNode = SKSpriteNode()

  override func didMoveToView(view: SKView) {
    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

    let background = SKSpriteNode(imageNamed: "Scene1.bg")
    background.position = centerPos

    let letter = SKSpriteNode(imageNamed: "letter")
    letter.position = centerPos
    
    self.addChild(background)
    self.addChild(letter)
    
    let scene1Atlas = SKTextureAtlas(named: "Scene1")
    
    var clickableFrames : SKTexture[] = []
    for var i = 1; i <= 36; i++ {
      let textureName = "clickable-\(i)"
      let texture = scene1Atlas.textureNamed(textureName)
      clickableFrames.append(texture)
    }
    let firstClickableTexture = clickableFrames[0]
    _clickableAnimationNode = SKSpriteNode(texture: firstClickableTexture)
    _clickableAnimationNode.position = centerPos
    self.addChild(_clickableAnimationNode)
    
    _clickableAnimationNode.runAction(
      SKAction.repeatAction(
        SKAction.animateWithTextures(clickableFrames, timePerFrame:0.1, resize:false, restore:true),
        count:1
      ),
      withKey:"clickableAnimation"
    )
  }
  
  func runClickableAnimation() {

  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    let touch = touches.anyObject() as UITouch
    let position = touch.locationInNode(self)
    let touchedNode = self.nodeAtPoint(position)
    
    NSLog("%s", touchedNode.name)
  }
}
