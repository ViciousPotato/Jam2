//
//  Scene2.swift
//  Jam2
//
//  Created by zhou on 14-6-17.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit

class Scene2 : BaseScene {
  let _sceneAtlas = SKTextureAtlas(named: "Scene2")

  // Fly animations
  var _flyNode = SKSpriteNode()
  var _flyAction = SKAction()
  
  // Boy animations
  var _boyNode = SKSpriteNode()
  var _boyAction = SKAction()

  override func didMoveToView(view: SKView) {
    super.didMoveToView(view)

    addBg("Scene2.bg")

    loadBoyAnimation()
    runBoyAnimation()
    
    let (flyNode, flyAction) = loadFlyAnimation()
    flyNode.showAtCenter(self)
    flyNode.runAction(flyAction, completion: { self.addCurl(self._sceneAtlas) })
  }
  
  func loadFlyAnimation() -> (SKSpriteNode, SKAction) {
    let animationFiles = (1...30).map({ "fly-\($0)" })
    return createAnimationFromAtlas(_sceneAtlas, files: animationFiles)
  }
  
  func runFlyAnimation() {
    _flyNode.position = CENTERPOS
    self.addChild(_flyNode)
    _flyNode.runAction(_flyAction, withKey: "flyAnimation")
  }
  
  func loadBoyAnimation() {
    let animationFiles = "boy1-12".repeat(12) + ["boy13", "boy14", "boy15"] + "boy16-30".repeat(15)
    println(animationFiles)
    (_boyNode, _boyAction) =
      createAnimationFromAtlas(_sceneAtlas, files: animationFiles)
  }
  
  func runBoyAnimation() {
    _boyNode.position = CENTERPOS
    self.addChild(_boyNode)
    _boyNode.runAction(_boyAction, withKey: "boyAnimation")
  }
}
