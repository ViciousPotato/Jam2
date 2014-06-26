//
//  BaseScene.swift
//  Jam2
//
//  Created by zhou on 14-6-27.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit

class BaseScene : SKScene {
  override func didMoveToView(view: SKView) {
    let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleLeftSwipe:")
    swipeLeftGestureRecognizer.direction = .Left
    self.view.addGestureRecognizer(swipeLeftGestureRecognizer)
    
    let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleRightSwipe:")
    swipeRightGestureRecognizer.direction = .Right
    self.view.addGestureRecognizer(swipeRightGestureRecognizer)
  }
}