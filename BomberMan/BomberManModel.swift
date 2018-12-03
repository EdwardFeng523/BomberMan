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
    
    var addOnX: Double = 0
    var addOnY: Double = 0
    
    var powerUps: [[Double]] = []
    
    
    
    var bush: [[Double]] = []
    
    var stone: [[Double]] = []
    
    var radius: Double = 0 {
        didSet{
            // put all add-ons in and put all map elements in
            
            bomberManX = minX + radius
            bomberManY = minY + radius
            bomberMan1X = maxX - radius
            bomberMan1Y = maxY - radius
            
            
            powerUps = [[(minX + maxX) / 2, (minY + maxY) / 2],
                      [(minX + maxX) / 4, (minY + maxY) / 2],
                      [3 * (minX + maxX) / 4, 2 * (minY + maxY) / 4]]
            
            stone = [[(minX + maxX) / 2 - 12 * radius, (minY + maxY) / 2 + 12 * radius],
                     [(minX + maxX) / 2 - 10 * radius, (minY + maxY) / 2 + 12 * radius],
                     [(minX + maxX) / 2 - 12 * radius, (minY + maxY) / 2 + 10 * radius],
                     
                     [(minX + maxX) / 2 - 12 * radius, (minY + maxY) / 2 - 12 * radius],
                     [(minX + maxX) / 2 - 10 * radius, (minY + maxY) / 2 - 12 * radius],
                     [(minX + maxX) / 2 - 12 * radius, (minY + maxY) / 2 - 10 * radius],
                     
                     [(minX + maxX) / 2 + 12 * radius, (minY + maxY) / 2 + 12 * radius],
                     [(minX + maxX) / 2 + 10 * radius, (minY + maxY) / 2 + 12 * radius],
                     [(minX + maxX) / 2 + 12 * radius, (minY + maxY) / 2 + 10 * radius],
                     
                     [(minX + maxX) / 2 + 12 * radius, (minY + maxY) / 2 - 12 * radius],
                     [(minX + maxX) / 2 + 10 * radius, (minY + maxY) / 2 - 12 * radius],
                     [(minX + maxX) / 2 + 12 * radius, (minY + maxY) / 2 - 10 * radius]
                    ]
            
            bush = [[(minX + maxX) / 2 - 10 * radius, (minY + maxY) / 2 + 10 * radius],
                    [(minX + maxX) / 2 - 8 * radius, (minY + maxY) / 2 + 10 * radius],
                    [(minX + maxX) / 2 - 10 * radius, (minY + maxY) / 2 + 8 * radius],
                    
                    [(minX + maxX) / 2 - 10 * radius, (minY + maxY) / 2 - 10 * radius],
                    [(minX + maxX) / 2 - 8 * radius, (minY + maxY) / 2 - 10 * radius],
                    [(minX + maxX) / 2 - 10 * radius, (minY + maxY) / 2 - 8 * radius],
                    
                    [(minX + maxX) / 2 + 10 * radius, (minY + maxY) / 2 + 10 * radius],
                    [(minX + maxX) / 2 + 8 * radius, (minY + maxY) / 2 + 10 * radius],
                    [(minX + maxX) / 2 + 10 * radius, (minY + maxY) / 2 + 8 * radius],
                    
                    [(minX + maxX) / 2 + 10 * radius, (minY + maxY) / 2 - 10 * radius],
                    [(minX + maxX) / 2 + 8 * radius, (minY + maxY) / 2 - 10 * radius],
                    [(minX + maxX) / 2 + 10 * radius, (minY + maxY) / 2 - 8 * radius]
            ]
            
//            stone = [[(minX + maxX) / 2 - 6 * radius, (minY + maxY) / 2 + 6 * radius],
//                     [(minX + maxX) / 2 - 6 * radius, (minY + maxY) / 2 + 4 * radius],
//                     [(minX + maxX) / 2 - 4 * radius, (minY + maxY) / 2 + 6 * radius]
//                    ]
        }
    }
    
    var bomberManX: Double = 0
    var bomberManY: Double = 0
    
    var bomberManRange: Double = 30
    
    var bomberMan1X: Double = 0
    var bomberMan1Y: Double = 0
    
    var bomberMan1Range: Double = 30
    
    var gameOver: Bool = false
    
    var bomberManWins: Bool = false
    
    var bomberMan1Wins: Bool = false
    
    var bombs: [[Double]] = []
    
//    func checkValidity(x: Double, y: Double) -> Bool {
//        if (x < minX || x > maxX || y < minY || y > maxY) {
//            return false
//        }
//        for ele in stone {
//            print ("checking")
//            let sx = ele[0]
//            let sy = ele[1]
//            if (abs(x - sx) < radius && abs(y - sy) < radius) {
//                return false
//            }
//        }
//        return true
//    }
    
    func checkValidity(x: Double, y: Double) -> Bool {
        if (x > maxX || x < minX || y > maxY || y < minY) {
            return false
        }
        for ele in stone {
            if (abs(x - ele[0]) < radius && abs(y - ele[1]) < radius) {
                return false
            }
        }
        return true
    }
    
    
    
    func checkAddOns() {
        
        var newPowerups: [[Double]] = []
        
        for powerUp in powerUps {
            if (bomberManX >= powerUp[0] - radius && bomberManX <= powerUp[0] + radius &&
                bomberManY >= powerUp[1] - radius && bomberManY <= powerUp[1] + radius) {
                bomberManRange *= 2
            }
            else if (bomberMan1X >= powerUp[0] - radius && bomberMan1X <= powerUp[0] + radius &&
                bomberMan1Y >= powerUp[1] - radius && bomberMan1Y <= powerUp[1] + radius) {
                bomberMan1Range *= 2
            }
            else {
                newPowerups.append(powerUp)
            }
        }
        powerUps = newPowerups
    }
    
    func moveRight() {
        if (checkValidity(x: bomberManX + 2 * radius, y: bomberManY)) {
             bomberManX += 2 * radius
        }
    }
    
    func moveLeft() {
        if (checkValidity(x: bomberManX - 2 * radius, y: bomberManY)) {
            bomberManX -= 2 * radius
        }
    }
    
    func moveUp () {
        if (checkValidity(x: bomberManX, y: bomberManY - 2 * radius)) {
            bomberManY -= 2 * radius
        }
    }
    
    func moveDown() {
        if (checkValidity(x: bomberManX, y: bomberManY + 2 * radius)) {
            bomberManY += 2 * radius
        }
    }
    
    func moveRight1() {
        if (checkValidity(x: bomberMan1X + 2 * radius, y: bomberMan1Y)) {
            bomberMan1X += 2 * radius
        }
    }
    
    func moveLeft1() {
        if (checkValidity(x: bomberMan1X - 2 * radius, y: bomberMan1Y)) {
            bomberMan1X -= 2 * radius
        }
    }
    
    func moveUp1 () {
        if (checkValidity(x: bomberMan1X, y: bomberMan1Y - 2 * radius)) {
            bomberMan1Y -= 2 * radius
        }
    }
    
    func moveDown1() {
        if (checkValidity(x: bomberMan1X, y: bomberMan1Y + 2 * radius)) {
            bomberMan1Y += 2 * radius
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
        powerUps = [[(minX + maxX) / 2, (minY + maxY) / 2],
                    [(minX + maxX) / 4, (minY + maxY) / 2],
                    [3 * (minX + maxX) / 4, (minY + maxY) / 2]]
        bomberManRange = 30
        bomberMan1Range = 30
    }
}
