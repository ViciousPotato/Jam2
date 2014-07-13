//
//  BaseScene.swift
//  Jam2
//
//  Created by zhou on 14-6-27.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit
import Swift

class BaseScene : SKScene {
  var CENTERPOS = CGPoint()
  var Scenes : AnyClass[] = [Scene1.self, Scene2.self, Scene3.self]

  var sceneIndex : Int {
    get {
      let clsName = nameOfClass(self.dynamicType)
      let range = clsName.rangeOfString("\\d+", options: .RegularExpressionSearch)
      let idxString = clsName.substringWithRange(range)
      if let index = idxString.toInt() {
        return index
      } else {
        NSLog("Convert class name failed: \(clsName), default to 0")
        return 0
      }
    }
    set(val) {  }
  }
  
  override func didMoveToView(view: SKView) {
    println(nameOfClass(self.dynamicType))
    let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleLeftSwipe:")
    swipeLeftGestureRecognizer.direction = .Left
    self.view.addGestureRecognizer(swipeLeftGestureRecognizer)
    
    let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleRightSwipe:")
    swipeRightGestureRecognizer.direction = .Right
    self.view.addGestureRecognizer(swipeRightGestureRecognizer)
    
    self.CENTERPOS = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    // NSLog("BaseScene init Point: %f, %f", CENTERPOS.x, CENTERPOS.y)
  }
  
  func addBg(name: String) {
    let background = SKSpriteNode(imageNamed: name)
    background.position = CENTERPOS
    self.addChild(background)
  }
  
  func addChildAtCenter(node: SKSpriteNode) {
    node.position = CENTERPOS
    addChild(node)
  }
  
  var currentSceneIndex : Int {
    get {
      return self.sceneIndex
      // TODO: fix below code
      /*
      if let idx = find(Scenes, self) {
        return idx
      }
      return -1;
      */
    }
    set (val) {
      self.sceneIndex = val;
    }
  }
  
  func handleLeftSwipe(recognizer: UISwipeGestureRecognizer) {
    // next scene
    if (sceneIndex >= Scenes.count) {
      NSLog("sceneIndex too large: \(sceneIndex) ignore.")
      return
    }
    let scene = (Scenes[sceneIndex] as BaseScene.Type).sceneWithSize(self.view.bounds.size)
    self.scene.view.presentScene(scene, transition:
      SKTransition.revealWithDirection(.Left, duration: 1.0))
  }
  
  func handleRightSwipe(recognizer: UISwipeGestureRecognizer) {
    // previous scene
    if (sceneIndex < 2) {
      NSLog("Scene index \(sceneIndex) too small, ignore swipe.")
      return
    }
    let scene = (Scenes[sceneIndex-2] as BaseScene.Type).sceneWithSize(self.view.bounds.size)
    self.scene.view.presentScene(scene, transition:
      SKTransition.revealWithDirection(.Right, duration: 1.0))
  }
  
  func createAnimationFromAtlas(atlas: SKTextureAtlas, files: String[]) -> (SKSpriteNode, SKAction) {
    var animationFrames : SKTexture[] = []

    for textureName in files {
      let texture = atlas.textureNamed(textureName)
      animationFrames.append(texture)
    }

    let animationNode = SKSpriteNode(texture: animationFrames[0])
    let animationAction = SKAction.animateWithTextures(
      animationFrames, timePerFrame:0.08, resize:false, restore:false)

    return (animationNode, animationAction)
  }
  
  func addCurl(atlas: SKTextureAtlas, filename: String = "curl") {
    let curlTexture = atlas.textureNamed(filename)
    let curlNode = SKSpriteNode(texture: curlTexture)
    curlNode.showAtCenter(self)
  }
}