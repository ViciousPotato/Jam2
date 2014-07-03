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
  override var sceneIndex : Int {
    get { return 3 }
    set(val) {  }
  }

  override func didMoveToView(view: SKView) {
    super.didMoveToView(view)
    
    addBg("Scene3.bg")
  }

  func loadFlyAnimation() {
    let animationFiles = Array(map(1...30) { "fly-\($0).png" })
  }
}