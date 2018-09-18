//
//  Bomb.swift
//  BomberMan
//
//  Created by Edward Feng on 9/16/18.
//  Copyright © 2018 Edward Feng. All rights reserved.
//

import Foundation
import UIKit

struct Bomb {
    var point: CGPoint
    var range: Double
    
    init(x: Double, y: Double, range: Double) {
        self.point = CGPoint(x: CGFloat(x), y:CGFloat(y))
        self.range = range
    }
}
