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
    var minX: Double = 0 {didSet{bomberManX = minX + 20}}
    var minY: Double = 0 {didSet{bomberManY = minY + 20}}
    var maxX: Double = 100 {didSet{bomberMan1X = maxX - 20}}
    var maxY: Double = 100 {didSet{bomberMan1Y = maxY - 20}}
    
    var bomberManX: Double = 45
    var bomberManY: Double = 195
    
    var bomberMan1X: Double = 265
    var bomberMan1Y: Double = 275
    
    var gameOver: Bool = false
    
    var bomberManWins: Bool = false
    
    var bomberMan1Wins: Bool = false
    
    var bombs: [[Double]] = []
    
    func moveRight() {
        if (bomberManX <= maxX - 30) {
             bomberManX += 20
        }
    }
    
    func moveLeft() {
        if (bomberManX >= minX + 30) {
            bomberManX -= 20
        }
    }
    
    func moveUp () {
        if (bomberManY >= minY + 30) {
            bomberManY -= 20
        }
    }
    
    func moveDown() {
        if (bomberManY <= maxY - 30) {
            bomberManY += 20
        }
    }
    
    func dropBomb() {
        bombs.append([bomberManX, bomberManY])
    }
    
    func explode() {
        var exploded = bombs.remove(at: 0)
        if (bomberManX >= exploded[0] - 10 && bomberManX <= exploded[0] + 10 && bomberManY >= exploded[1] - 40 && bomberManY <= exploded[1] + 40) {
            gameOver = true
        } else if (bomberManX >= exploded[0] - 40 && bomberManX <= exploded[0] + 40 && bomberManY >= exploded[1] - 10 && bomberManY <= exploded[1] + 10) {
            gameOver = true
        }
    }
    
    func restart() {
        gameOver = false
        bomberManWins = false
        bomberMan1Wins = false
        bomberManX = 120
        bomberManY = 120
        bombs = []
    }
}
