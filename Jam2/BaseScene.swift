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
  var sceneIndex : Int = -1

  override func didMoveToView(view: SKView) {
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
    let scene = (Scenes[sceneIndex] as BaseScene.Type).sceneWithSize(self.view.bounds.size)
    self.scene.view.presentScene(scene, transition:
      SKTransition.revealWithDirection(.Left, duration: 1.0))
  }
  
  func handleRightSwipe(recognizer: UISwipeGestureRecognizer) {
    // previous scene
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
      animationFrames, timePerFrame:0.08, resize:false, restore:true)

    return (animationNode, animationAction)
  }
}