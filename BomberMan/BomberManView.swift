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
            let bombPath = UIBezierPath(arcCenter: bomb, radius: 10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
            UIColor.red.set()
            bombPath.stroke()
            bombPath.fill()
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
        for bomb in bombs {
            temp.append(CGPoint(x: bomb[0], y: bomb[1]))
        }
        currentBombs = temp
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
        let corner1 = CGPoint(x: center.x - CGFloat(radius), y: center.y - CGFloat(radius))
        let corner2 = CGPoint(x: center.x - 10, y: center.y - 30)
        let corner3 = CGPoint(x: center.x + 10, y: center.y - 30)
        let corner4 = CGPoint(x: center.x + 10, y: center.y - 10)
        let corner5 = CGPoint(x: center.x + 30, y: center.y - 10)
        let corner6 = CGPoint(x: center.x + 30, y: center.y + 10)
        let corner7 = CGPoint(x: center.x + 10, y: center.y + 10)
        let corner8 = CGPoint(x: center.x + 10, y: center.y + 30)
        let corner9 = CGPoint(x: center.x - 10, y: center.y + 30)
        let corner10 = CGPoint(x: center.x - 10, y: center.y + 10)
        let corner11 = CGPoint(x: center.x - 30, y: center.y + 10)
        let corner12 = CGPoint(x: center.x - 30, y: center.y - 10)
        temp.append([corner1, corner2, corner3, corner4, corner5, corner6, corner7, corner8, corner9, corner10, corner11, corner12])
        explosionBoxes = temp
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {[weak self]_ in
            var changed = self?.explosionBoxes
            changed?.remove(at: 0)
            self?.explosionBoxes = changed!
        }

    }

}
