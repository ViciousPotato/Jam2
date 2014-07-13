//
//  Extensions.swift
//  Jam2
//
//  Created by zhou on 14-7-6.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation
import SpriteKit

extension String {
  func repeat(i: Int) -> String[] {
    return Array(map(1...i) { (i : Int) -> String in
      return self
    })
  }
}

extension Range {
  func map(f: T -> String) -> String[] {
    var arr: String[] = []
    for i in self {
      arr.append(f(i))
    }
    return arr
  }
}

extension SKSpriteNode {
  func showAtCenter(s: SKScene) {
    let center = CGPoint(x: CGRectGetMidX(s.frame), y:CGRectGetMidY(s.frame))
    self.position = center
    s.addChild(self)
  }
}

func nameOfClass(classType: AnyClass) -> String {
  let stringOfClassType: String = NSStringFromClass(classType)
  
  // parse the returned string
  let swiftClassPrefix = "_TtC"
  if stringOfClassType.hasPrefix(swiftClassPrefix) {
    // convert the string into an array for easyer access to the characters in it
    let characters = Array(stringOfClassType)
    var ciphersForModule = String()
    // parse the ciphers for the module name's length
    var index = countElements(swiftClassPrefix)
    while index < characters.count {
      let character = characters[index++]
      if String(character).toInt() {
        // character is a cipher
        ciphersForModule += character
      } else {
        // no cipher, module name begins
        break
      }
    }
    // create a number from the ciphers
    if let numberOfCharactersOfModuleName = ciphersForModule.toInt() {
      // ciphers contains a valid number, so skip the module name minus 1 because we already read one character of the module name
      index += numberOfCharactersOfModuleName - 1
      var ciphersForClass = String()
      while index < characters.count {
        let character = characters[index++]
        if String(character).toInt() {
          // character is a cipher
          ciphersForClass += character
        } else {
          // no cipher, class name begins
          break
        }
      }
      // create a number from the ciphers
      if let numberOfCharactersOfClassName = ciphersForClass.toInt() {
        // number parsed, but make sure it does not exceeds the string's length
        if numberOfCharactersOfClassName > 0 && index - 1 + numberOfCharactersOfClassName <= characters.count {
          // valid number, get the substring which should be the classes' name
          let range = NSRange(location: index - 1, length: numberOfCharactersOfClassName)
          let nameOfClass = (stringOfClassType as NSString).substringWithRange(range)
          return nameOfClass
        }
      }
    }
  }
  
  // string couldn't be parsed so just return the returned string
  return stringOfClassType
}
