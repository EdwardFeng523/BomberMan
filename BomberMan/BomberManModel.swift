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
    var maxX: Double = 0 {didSet{bomberMan1X = maxX - 20}}
    var maxY: Double = 0 {didSet{bomberMan1Y = maxY - 20}}
    
    var bomberManX: Double = 0
    var bomberManY: Double = 0
    
    var bomberMan1X: Double = 0
    var bomberMan1Y: Double = 0
    
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
    
    func moveRight1() {
        if (bomberMan1X <= maxX - 30) {
            bomberMan1X += 20
        }
    }
    
    func moveLeft1() {
        if (bomberMan1X >= minX + 30) {
            bomberMan1X -= 20
        }
    }
    
    func moveUp1 () {
        if (bomberMan1Y >= minY + 30) {
            bomberMan1Y -= 20
        }
    }
    
    func moveDown1() {
        if (bomberMan1Y <= maxY - 30) {
            bomberMan1Y += 20
        }
    }
    
    func dropBomb() {
        bombs.append([bomberManX, bomberManY])
    }
    
    func dropBomb1() {
        bombs.append([bomberMan1X, bomberMan1Y])
    }
    
    func explode() {
        var exploded = bombs.remove(at: 0)
        if (bomberManX > exploded[0] - 10 && bomberManX < exploded[0] + 10 && bomberManY > exploded[1] - 40 && bomberManY < exploded[1] + 40) {
            gameOver = true
            bomberMan1Wins = true
        } else if (bomberManX > exploded[0] - 40 && bomberManX < exploded[0] + 40 && bomberManY > exploded[1] - 10 && bomberManY < exploded[1] + 10) {
            gameOver = true
            bomberMan1Wins = true
        } else if (bomberMan1X > exploded[0] - 10 && bomberMan1X < exploded[0] + 10 && bomberMan1Y > exploded[1] - 40 && bomberMan1Y < exploded[1] + 40) {
            gameOver = true
            bomberManWins = true
        } else if (bomberMan1X > exploded[0] - 40 && bomberMan1X < exploded[0] + 40 && bomberMan1Y > exploded[1] - 10 && bomberMan1Y < exploded[1] + 10) {
            gameOver = true
            bomberManWins = true
        }
    }
    
    func restart() {
        gameOver = false
        bomberManWins = false
        bomberMan1Wins = false
        bomberManX = minX + 20
        bomberManY = minY + 20
        bomberMan1X = maxX - 20
        bomberMan1Y = maxY - 20
        bombs = []
    }
}
