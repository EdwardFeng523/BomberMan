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
    var minX: Double = 0 {didSet{radius = (min(maxX - minX, maxY - minY)) / 30}}
    var minY: Double = 0 {didSet{radius = (min(maxX - minX, maxY - minY)) / 30}}
    var maxX: Double = 0 {didSet{radius = (min(maxX - minX, maxY - minY)) / 30}}
    var maxY: Double = 0 {didSet{radius = (min(maxX - minX, maxY - minY)) / 30}}
    
    
//    var bomberMan1 = BomberMan(x: 10, y: 10, radius: 20, range: 10)
//    var bomberMan2 = BomberMan(x: 10, y: 10, radius: 20, range: 10)
    
    
    
    
    var radius: Double = 0 {
        didSet{
            bomberManX = minX + radius
            bomberManY = minY + radius
            bomberMan1X = maxX - radius
            bomberMan1Y = maxY - radius
        }
    }
    
    var bomberManX: Double = 0
    var bomberManY: Double = 0
    
    var bomberManRange: Double = 100
    
    var bomberMan1X: Double = 0
    var bomberMan1Y: Double = 0
    
    var bomberMan1Range: Double = 30
    
    var gameOver: Bool = false
    
    var bomberManWins: Bool = false
    
    var bomberMan1Wins: Bool = false
    
    var bombs: [[Double]] = []
    
    func moveRight() {
        if (bomberManX < maxX - radius) {
             bomberManX += radius
        }
    }
    
    func moveLeft() {
        if (bomberManX > minX + radius) {
            bomberManX -= radius
        }
    }
    
    func moveUp () {
        if (bomberManY > minY + radius) {
            bomberManY -= radius
        }
    }
    
    func moveDown() {
        if (bomberManY < maxY - radius) {
            bomberManY += radius
        }
    }
    
    func moveRight1() {
        if (bomberMan1X < maxX - radius) {
            bomberMan1X += radius
        }
    }
    
    func moveLeft1() {
        if (bomberMan1X > minX + radius) {
            bomberMan1X -= radius
        }
    }
    
    func moveUp1 () {
        if (bomberMan1Y > minY + radius) {
            bomberMan1Y -= radius
        }
    }
    
    func moveDown1() {
        if (bomberMan1Y < maxY - radius) {
            bomberMan1Y += radius
        }
    }
    
    func dropBomb() {
        bombs.append([bomberManX, bomberManY, bomberManRange])
    }
    
    func dropBomb1() {
        bombs.append([bomberMan1X, bomberMan1Y, bomberMan1Range])
    }
    
    func explode() {
        var exploded = bombs.remove(at: 0)
        if (bomberManX > exploded[0] - 10 && bomberManX < exploded[0] + 10 && bomberManY > exploded[1] - (radius + exploded[2]) && bomberManY < exploded[1] + (radius + exploded[2])) {
            gameOver = true
            bomberMan1Wins = true
        } else if (bomberManX > exploded[0] - (radius + exploded[2]) && bomberManX < exploded[0] + (radius + exploded[2]) && bomberManY > exploded[1] - 10 && bomberManY < exploded[1] + 10) {
            gameOver = true
            bomberMan1Wins = true
        } else if (bomberMan1X > exploded[0] - 10 && bomberMan1X < exploded[0] + 10 && bomberMan1Y > exploded[1] - (radius + exploded[2]) && bomberMan1Y < exploded[1] + (radius + exploded[2])) {
            gameOver = true
            bomberManWins = true
        } else if (bomberMan1X > exploded[0] - (radius + exploded[2]) && bomberMan1X < exploded[0] + (radius + exploded[2]) && bomberMan1Y > exploded[1] - 10 && bomberMan1Y < exploded[1] + 10) {
            gameOver = true
            bomberManWins = true
        }
    }
    
    func restart() {
        gameOver = false
        bomberManWins = false
        bomberMan1Wins = false
        bomberManX = minX + radius
        bomberManY = minY + radius
        bomberMan1X = maxX - radius
        bomberMan1Y = maxY - radius
        bombs = []
    }
}
