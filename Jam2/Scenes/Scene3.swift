//
//  Scene3.swift
//  Jam2
//
//  Created by zhou on 14-6-27.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit

class Scene3 : BaseScene {
  let _sceneAtlas = SKTextureAtlas(named: "Scene3")

  // Fly animations
  var _flyNode = SKSpriteNode()
  var _flyAction = SKAction()

  // Boy animations
  var _boyNode = SKSpriteNode()
  var _boyAction = SKAction()

  override var sceneIndex : Int {
    get { return 3 }
    set(val) {  }
  }

  override func didMoveToView(view: SKView) {
    super.didMoveToView(view)
    
    addBg("Scene3.bg")
  }

  func loadFlyAnimation() {
    let animationFiles = Array(map(1...30) { "fly-\($0)" })
    (_flyNode, _flyAction) =
      createAnimationFromAtlas(_sceneAtlas, files: animationFiles)
  }

  func loadBoyAnimation() {
    let animationFiles = "boy1-12".repeat(12) + ["boy-13", "boy-14", "boy-15"] + "boy16-30".repeat(15)
     (_boyNode, _boyAction) =
       createAnimationFromAtlas(_sceneAtlas, files: animationFiles)
  }
}