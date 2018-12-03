//
//  BomberManView.swift
//  BomberMan
//
//  Created by Edward Feng on 6/9/18.
//  Copyright © 2018 Edward Feng. All rights reserved.
//

import UIKit

class BomberManView: UIView {
    
    var coord: CGPoint = CGPoint(x: 0, y: 0) { didSet{setNeedsDisplay()}}
    
    var coord1: CGPoint = CGPoint(x: 0, y: 0) { didSet{setNeedsDisplay()}}
    
    var currentBombs: [CGPoint] = [] { didSet{setNeedsDisplay()} }
    
    var currentPowerUps: [CGPoint] = [] { didSet{setNeedsDisplay()} }
    
    var currentStone: [CGPoint] = [] { didSet{setNeedsDisplay()} }
    
    var currentBush: [CGPoint] = [] { didSet{setNeedsDisplay()} }
    
    var currentBombsRange: [Double] = [] { didSet{setNeedsDisplay()}}
    
    var explosionBoxes: [[CGPoint]] = [] { didSet{setNeedsDisplay()}}
    
    var radius : Double = 0 {didSet{setNeedsDisplay()}}
    
    

    func playerPath() -> UIBezierPath {
        return UIBezierPath(arcCenter: coord, radius: CGFloat(radius), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
    }
    
    func player1Path() -> UIBezierPath {
        return UIBezierPath(arcCenter: coord1, radius: CGFloat(radius), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let length = 0.9 * min(bounds.width, bounds.height)

        let boundPath = UIBezierPath(rect: CGRect(origin: CGPoint(x: bounds.midX - 0.5 * length, y: bounds.midY - 0.5 * length), size: CGSize(width: length, height: length)))
        
        boundPath.lineWidth = 3.0
        
        UIColor.blue.setStroke()
        boundPath.stroke()
        
        
        UIColor.blue.setStroke()
        let player = playerPath()
        player.lineWidth = 3.0
        player.stroke()
        
        
        UIColor.purple.setStroke()
        let player1 = player1Path()
        player1.lineWidth = 3.0
        player1.stroke()
        
        for bomb in currentBombs {
            let bombPath = UIBezierPath(arcCenter: bomb, radius: CGFloat(radius), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
            UIColor.red.set()
            bombPath.stroke()
            bombPath.fill()
        }
        
        for powerUp in currentPowerUps {
            let powerUpPath = UIBezierPath(arcCenter: powerUp, radius: CGFloat(radius), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
            UIColor.cyan.set()
            powerUpPath.stroke()
            powerUpPath.fill()
        }
        
        for element in currentStone {
            let path = UIBezierPath()
            let upperLeft = CGPoint(x: element.x - CGFloat(radius), y: element.y - CGFloat(radius))
            let lowerLeft = CGPoint(x: element.x - CGFloat(radius), y: element.y + CGFloat(radius))
            let lowerRight = CGPoint(x: element.x + CGFloat(radius), y: element.y + CGFloat(radius))
            let upperRight = CGPoint(x: element.x + CGFloat(radius), y: element.y - CGFloat(radius))
            path.move(to: upperLeft)
            path.addLine(to: lowerLeft)
            path.addLine(to: lowerRight)
            path.addLine(to: upperRight)
            path.addLine(to: upperLeft)
            UIColor.black.set()
            path.close()
            path.fill()
            path.stroke()
        }
        
        for element in currentBush {
            let path = UIBezierPath()
            let upperLeft = CGPoint(x: element.x - CGFloat(radius), y: element.y - CGFloat(radius))
            let lowerLeft = CGPoint(x: element.x - CGFloat(radius), y: element.y + CGFloat(radius))
            let lowerRight = CGPoint(x: element.x + CGFloat(radius), y: element.y + CGFloat(radius))
            let upperRight = CGPoint(x: element.x + CGFloat(radius), y: element.y - CGFloat(radius))
            path.move(to: upperLeft)
            path.addLine(to: lowerLeft)
            path.addLine(to: lowerRight)
            path.addLine(to: upperRight)
            path.addLine(to: upperLeft)
            UIColor.green.set()
            path.close()
            path.fill()
            path.stroke()
        }
        
        
        for box in explosionBoxes {
            let path = UIBezierPath()
            path.move(to: box[0])
            let length = box.count
            for idx in 1...length - 1 {
                path.addLine(to: box[idx])
            }
            UIColor.red.set()
            path.close()
            path.fill()
            path.stroke()
        }
    }
    
    func resetBomberManPosition(x: Double, y: Double) {
        coord = CGPoint(x: x, y: y)
    }
    
    func resetBomberMan1Poition(x: Double, y: Double) {
        coord1 = CGPoint(x: x, y: y)
    }
    
    func refreshBombs(bombs: [[Double]]) {
        var temp: [CGPoint] = []
        var rangeTemp: [Double] = []
        for bomb in bombs {
            temp.append(CGPoint(x: bomb[0], y: bomb[1]))
            rangeTemp.append(bomb[2])
        }
        currentBombs = temp
        currentBombsRange = rangeTemp
    }
    
    func refreshPowerUps(powerUps: [[Double]]) {
        var temp: [CGPoint] = []
        for powerUp in powerUps {
            temp.append(CGPoint(x: powerUp[0], y: powerUp[1]))
        }
        currentPowerUps = temp
    }
    
    func refreshStone(stone: [[Double]]) {
        var temp: [CGPoint] = []
        for element in stone {
            temp.append(CGPoint(x: element[0], y: element[1]))
        }
        currentStone = temp
    }
    
    func refreshBush(bush: [[Double]]) {
        var temp: [CGPoint] = []
        for element in bush {
            temp.append(CGPoint(x: element[0], y: element[1]))
        }
        currentBush = temp
    }
    
    func getMinX() -> Double {
        let length = 0.9 * min(bounds.width, bounds.height)
        return Double(bounds.midX - 0.5 * length)
    }
    
    func getMinY() -> Double {
        let length = 0.9 * min(bounds.width, bounds.height)
        return Double(bounds.midY - 0.5 * length)
    }
    
    func getMaxX() -> Double {
        let length = 0.9 * min(bounds.width, bounds.height)
        return Double(bounds.midX + 0.5 * length)
    }
    
    func getMaxY() -> Double {
        let length = 0.9 * min(bounds.width, bounds.height)
        return Double(bounds.midY + 0.5 * length)
    }
    
    func explode() {
        var temp = explosionBoxes
        let center = currentBombs.remove(at: 0)
        let range = currentBombsRange.remove(at: 0)
        let corner1 = CGPoint(x: center.x - CGFloat(radius), y: center.y - CGFloat(radius))
        let corner2 = CGPoint(x: center.x - CGFloat(radius), y: center.y - CGFloat(range))
        let corner3 = CGPoint(x: center.x + CGFloat(radius), y: center.y - CGFloat(range))
        let corner4 = CGPoint(x: center.x + CGFloat(radius), y: center.y - CGFloat(radius))
        let corner5 = CGPoint(x: center.x + CGFloat(range), y: center.y - CGFloat(radius))
        let corner6 = CGPoint(x: center.x + CGFloat(range), y: center.y + CGFloat(radius))
        let corner7 = CGPoint(x: center.x + CGFloat(radius), y: center.y + CGFloat(radius))
        let corner8 = CGPoint(x: center.x + CGFloat(radius), y: center.y + CGFloat(range))
        let corner9 = CGPoint(x: center.x - CGFloat(radius), y: center.y + CGFloat(range))
        let corner10 = CGPoint(x: center.x - CGFloat(radius), y: center.y + CGFloat(radius))
        let corner11 = CGPoint(x: center.x - CGFloat(range), y: center.y + CGFloat(radius))
        let corner12 = CGPoint(x: center.x - CGFloat(range), y: center.y - CGFloat(radius))
        temp.append([corner1, corner2, corner3, corner4, corner5, corner6, corner7, corner8, corner9, corner10, corner11, corner12])
        explosionBoxes = temp
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {[weak self]_ in
            var changed = self?.explosionBoxes
            changed?.remove(at: 0)
            self?.explosionBoxes = changed!
        }

    }

}
