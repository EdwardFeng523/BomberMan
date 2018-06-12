//
//  BomberManModel.swift
//  BomberMan
//
//  Created by Edward Feng on 6/9/18.
//  Copyright © 2018 Edward Feng. All rights reserved.
//

import Foundation


class BomberManModel
{
    
    var maxX: Double = 100
    var maxY: Double = 100
    var bomberManX: Double = 20
    var bomberManY: Double = 20
    
    var bombs: [[Double]] = []
    
    func moveRight() {
        if (bomberManX <= maxX - 10) {
             bomberManX += 20
        }
    }
    
    func moveLeft() {
        if (bomberManX >= 10) {
            bomberManX -= 20
        }
    }
    
    func moveUp () {
        if (bomberManY >= 10) {
            bomberManY -= 20
        }
    }
    
    func moveDown() {
        if (bomberManY <= maxY - 10) {
            bomberManY += 20
        }
    }
    
    func dropBomb() {
        bombs.append([bomberManX, bomberManY])
    }
    
    func explode() {
        var exploded = bombs.remove(at: 0)
        if (bomberManX >= exploded[0] - 10 && bomberManX <= exploded[0] + 10 && bomberManY >= exploded[1] - 40 && bomberManY <= exploded[1] + 40) {
            print ("Game over")
        }
        if (bomberManX >= exploded[0] - 40 && bomberManX <= exploded[0] + 40 && bomberManY >= exploded[1] - 10 && bomberManY <= exploded[1] + 10) {
            print ("Game over")
        }
    }
}
