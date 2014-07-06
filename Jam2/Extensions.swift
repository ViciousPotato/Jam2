//
//  Extensions.swift
//  Jam2
//
//  Created by zhou on 14-7-6.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

import Foundation

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