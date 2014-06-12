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
  let _scene1Atlas = SKTextureAtlas(named: "Scene1")

  var _clickableAnimationNode = SKSpriteNode()

  var _birdAnimationNode = SKSpriteNode()
  var _birdAnimationFrames : SKTexture[] = []

  func loadBirdAnimation() {
    for var i = 1; i < 60; i++ {
      let textureName = "bird-\(i)"
      let texture = _scene1Atlas.textureNamed(textureName)
      _birdAnimationFrames.append(texture)
    }
    _birdAnimationNode = SKSpriteNode(texture: _birdAnimationFrames[0])
    _birdAnimationNode.position = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
  }
  
  func runBirdAnimation() {
    self.addChild(_birdAnimationNode)
    _birdAnimationNode.runAction(
      SKAction.repeatAction(
        SKAction.animateWithTextures(_birdAnimationFrames, timePerFrame:0.1, resize:false, restore:false),
        count:1
      ),
      withKey:"clickableAnimation"
    )
  }
  
  override func didMoveToView(view: SKView) {
    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

    let background = SKSpriteNode(imageNamed: "Scene1.bg")
    background.position = centerPos

    let letter = SKSpriteNode(imageNamed: "letter")
    letter.position = CGPoint(x:545, y:123)
    letter.name = "letter"
    
    self.addChild(background)
    self.addChild(letter)
    
    var clickableFrames : SKTexture[] = []
    for var i = 1; i <= 36; i++ {
      let textureName = "clickable-\(i)"
      let texture = _scene1Atlas.textureNamed(textureName)
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
    
    loadBirdAnimation()
  }
  
  func runClickableAnimation() {

  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    let touch = touches.anyObject() as UITouch
    let position = touch.locationInNode(self)
    if let touchedNode = self.nodeAtPoint(position) {
      if let name = touchedNode.name {
        if name == "letter" {
          touchedNode.removeFromParent()
          runBirdAnimation()
        }
      }
    }
  }
}
