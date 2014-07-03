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

  override var sceneIndex : Int {
    get { return 2 }
    set(val) {}
  }

  override func didMoveToView(view: SKView) {
    super.didMoveToView(view)

    addBg("Scene2.bg")
  }
}
