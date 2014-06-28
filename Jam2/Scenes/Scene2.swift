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
  override func didMoveToView(view: SKView) {
    super.didMoveToView(view)

    addBg("Scene2.bg")
  }
  
  func handleLeftSwipe(recognizer: UISwipeGestureRecognizer) {
    let s3 = Scene3.sceneWithSize(self.view.bounds.size)
    self.scene.view.presentScene(s3, transition:
      SKTransition.revealWithDirection(.Left, duration: 1.0))
  }
  
  func handleRightSwipe(recognizer: UISwipeGestureRecognizer) {
    let s1 = Scene1.sceneWithSize(self.view.bounds.size)
    self.scene.view.presentScene(s1, transition:
      SKTransition.revealWithDirection(.Right, duration: 1.0))
  }

}
