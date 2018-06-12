//
//  ViewController.swift
//  BomberMan
//
//  Created by Edward Feng on 6/9/18.
//  Copyright © 2018 Edward Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bomberManView: BomberManView! {
        didSet{
            bomberManModel.maxX = bomberManView.getMaxX()
            bomberManModel.maxY = bomberManView.getMaxY()
            updateUI()
        }
    }
    
    var bomberManModel = BomberManModel() {
        didSet{
            print ("didset")
            updateUI()
        }
    }
    
    @IBAction func rightButton(_ sender: Any) {
        bomberManModel.moveRight()
        updateUI()
    }
    
    @IBAction func downButton(_ sender: Any) {
        bomberManModel.moveDown()
        updateUI()
    }
    
    @IBAction func leftButton(_ sender: Any) {
        bomberManModel.moveLeft()
        updateUI()
    }
    
    @IBAction func upButton(_ sender: Any) {
        bomberManModel.moveUp()
        updateUI()
    }
    
    @IBAction func dropBomb(_ sender: Any) {
        bomberManModel.dropBomb()
        updateUI()
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {[weak self]_ in
            self?.bomberManModel.explode()
            self?.bomberManView.explode()
            self?.updateUI()
        }
    }
    
    func updateUI() {
        bomberManModel.maxX = bomberManView.getMaxX()
        bomberManModel.maxY = bomberManView.getMaxY()
        bomberManView?.resetBomberManPosition(x: bomberManModel.bomberManX, y: bomberManModel.bomberManY)
        bomberManView?.refreshBombs(bombs: bomberManModel.bombs)
    }
}

