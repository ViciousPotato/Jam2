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
  var _swipeGestureRecognizer = UISwipeGestureRecognizer()
  let _scene1Atlas = SKTextureAtlas(named: "Scene1")

  var _birdAnimationNode = SKSpriteNode()
  var _birdAnimationAction = SKAction()

  var _cartAnimationNode = SKSpriteNode()
  var _cartAnimationAction = SKAction()

  var _catAnimationNode = SKSpriteNode()
  var _catAnimationAction = SKAction()

  var _clickableAnimationNode = SKSpriteNode()
  var _clickableAnimationAction = SKAction()

  func loadClickableAnimation() {
    var clickableAnimationFrames : SKTexture[] = []
    for i in 1...36 {
      let textureName = "clickable-\(i)"
      let texture = _scene1Atlas.textureNamed(textureName)
      clickableAnimationFrames.append(texture)
    }
    _clickableAnimationNode = SKSpriteNode(texture: clickableAnimationFrames[0])
    _clickableAnimationAction = SKAction.animateWithTextures(
      clickableAnimationFrames, timePerFrame:0.08, resize:false, restore:true)
  }
  
  func runClickableAnimation() {
    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    _clickableAnimationNode.position = centerPos
    self.addChild(_clickableAnimationNode)

    _clickableAnimationNode.runAction(
      _clickableAnimationAction,
      withKey:"clickableAnimation"
    )
  }
  
  func loadBirdAnimation() {
    var birdAnimationFrames : SKTexture[] = []
    for i in 1...60 {
      let textureName = "bird-\(i)"
      let texture = _scene1Atlas.textureNamed(textureName)
      birdAnimationFrames.append(texture)
    }
    let curlTexture = _scene1Atlas.textureNamed("curl")
    birdAnimationFrames.append(curlTexture)
    _birdAnimationNode = SKSpriteNode(texture: birdAnimationFrames[0])
    _birdAnimationAction = SKAction.animateWithTextures(birdAnimationFrames, timePerFrame:0.08)
  }
  
  func runBirdAnimation() {
    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    _birdAnimationNode.position = centerPos
    self.addChild(_birdAnimationNode)

    _birdAnimationNode.runAction(
      _birdAnimationAction, withKey:"birdAnimation"
    )
  }

  func loadCartAnimation() {
    var cartAnimationFrames : SKTexture[] = []
    for i in 1...41 {
      let textureName = "cart-\(i)"
      let texture = _scene1Atlas.textureNamed(textureName)
      cartAnimationFrames.append(texture)
    }
    _cartAnimationNode = SKSpriteNode(texture: cartAnimationFrames[0])
    _cartAnimationAction = SKAction.animateWithTextures(cartAnimationFrames, timePerFrame:0.08)
  }
  
  func runCartAnimation() {
    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    _cartAnimationNode.position = centerPos
    self.addChild(_cartAnimationNode)

    _cartAnimationNode.runAction(
      _cartAnimationAction, withKey:"cartAnimation"
    )
  }
  
  func loadCatAnimation() {
    var catAnimationFrames : SKTexture[] = []
    for i in 1...7 {
      let textureName = "cat-\(i)"
      let texture = _scene1Atlas.textureNamed(textureName)
      catAnimationFrames.append(texture)
    }
    
    var catTurnHeadFrames = [
      _scene1Atlas.textureNamed("cat-turnhead")
    ]
    
    _catAnimationNode = SKSpriteNode(texture: catAnimationFrames[0])
    _catAnimationAction = SKAction.sequence([
      SKAction.animateWithTextures(catAnimationFrames, timePerFrame:0.08),
      SKAction.waitForDuration(4.5),
      SKAction.animateWithTextures(catTurnHeadFrames, timePerFrame:0.08)
    ])
  }
  
  func runCatAnimation() {
    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    _catAnimationNode.position = centerPos
    self.addChild(_catAnimationNode)
    
    _cartAnimationNode.removeFromParent() // removes cart cz cat animation using same images.
    
    _catAnimationNode.runAction(
      _catAnimationAction, withKey:"catAnimation"
    )
  }
  
  override func didMoveToView(view: SKView) {
    _swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
    _swipeGestureRecognizer.direction = .Left
    self.view.addGestureRecognizer(_swipeGestureRecognizer)

    let centerPos = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

    let background = SKSpriteNode(imageNamed: "Scene1.bg")
    background.position = centerPos

    let letter = SKSpriteNode(imageNamed: "letter")
    letter.position = CGPoint(x:545, y:123)
    letter.name = "letter"
    
    self.addChild(background)
    self.addChild(letter)
    
    loadClickableAnimation()
    runClickableAnimation()
    
    loadBirdAnimation()
    loadCatAnimation()
    
    loadCartAnimation()
    runCartAnimation()
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    let touch = touches.anyObject() as UITouch
    let position = touch.locationInNode(self)
    if let touchedNode = self.nodeAtPoint(position) {
      if let name = touchedNode.name {
        if name == "letter" {
          touchedNode.removeFromParent()
          runBirdAnimation()
          runCatAnimation()
        }
      }
    }
  }
  
  func handleSwipe(recognizer: UISwipeGestureRecognizer) {
    let s2 = Scene2.sceneWithSize(self.view.bounds.size)
    self.scene.view.presentScene(s2, transition:
      SKTransition.revealWithDirection(.Left, duration: 1.0))
  }
}
