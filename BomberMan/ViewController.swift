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
            bomberManModel.minX = bomberManView.getMinX()
            bomberManModel.minY = bomberManView.getMinY()
//            updateUI()
        }
    }
    
    var bomberManModel = BomberManModel() {
        didSet{
            print ("didset")
            updateUI()
        }
    }
    
    override func viewDidLayoutSubviews() {
        let newAlert = UIAlertController(title: "Welcome to BomberMan", message: "New game?", preferredStyle: .alert)
        let button = UIAlertAction(title: "Start", style: .default) {[weak self] _ in
            self?.updateUI()
        }
        newAlert.addAction(button)
        present(newAlert, animated: true, completion: nil)
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
    
    
    @IBAction func leftButton1(_ sender: Any) {
        bomberManModel.moveLeft1()
        updateUI()
    }
    
    @IBAction func downButton1(_ sender: Any) {
        bomberManModel.moveDown1()
        updateUI()
    }
    
    @IBAction func rightButton1(_ sender: Any) {
        bomberManModel.moveRight1()
        updateUI()
    }
    
    @IBAction func upButton1(_ sender: Any) {
        bomberManModel.moveUp1()
        updateUI()
    }
    
    @IBAction func dropBomb1(_ sender: Any) {
        bomberManModel.dropBomb1()
        updateUI()
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {[weak self]_ in
            self?.bomberManModel.explode()
            self?.bomberManView.explode()
            self?.updateUI()
        }
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
        if (bomberManModel.maxX != bomberManView.getMaxX()
            || bomberManModel.maxY != bomberManView.getMaxY()
            || bomberManModel.minX != bomberManView.getMinX()
            || bomberManModel.minY != bomberManView.getMinY()) {
            bomberManModel.maxX = bomberManView.getMaxX()
            bomberManModel.maxY = bomberManView.getMaxY()
            bomberManModel.minX = bomberManView.getMinX()
            bomberManModel.minY = bomberManView.getMinY()
        }
        

        bomberManView?.radius = Double(bomberManModel.radius)
        
        bomberManView?.resetBomberManPosition(x: bomberManModel.bomberManX, y: bomberManModel.bomberManY)
        bomberManView?.resetBomberMan1Poition(x: bomberManModel.bomberMan1X, y: bomberManModel.bomberMan1Y)
        bomberManView?.refreshBombs(bombs: bomberManModel.bombs)
        if (bomberManModel.gameOver == true) {
            
            var msg: String = ""
            if (bomberManModel.bomberMan1Wins) {
                msg = "Purple wins"
            } else {
                msg = "Blue wins"
            }
            
            let alert = UIAlertController(title: "Game over", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Restart", style: .default, handler: {[weak self]_ in
                self?.bomberManModel.restart()
                self?.updateUI()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }
}

