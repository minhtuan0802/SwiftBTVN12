//
//  ViewController.swift
//  Day12
//
//  Created by Ngô Minh Tuấn on 16/06/2021.
//

import UIKit

class ViewController: UIViewController {
    var timer : Timer!
    var countGreen = 30
    var countYellow = 3
    var countRed = 60

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var greenLable: UILabel!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var yellowLable: UILabel!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var redLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenView.layer.cornerRadius = 50
        yellowView.layer.cornerRadius = 50
        redView.layer.cornerRadius = 50
        
        greenView.alpha = 1
        yellowView.alpha = 0.2
        redView.alpha = 0.2
        
        greenLable.text = "30"
        yellowLable.text = ""
        redLable.text = ""
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func runTimer() {
        countGreen -= 1
        greenLable.text = String(format: "%02d", countGreen)
        if countGreen <= 0 {
            greenView.alpha = 0.2
            yellowView.alpha = 1
            redView.alpha = 0.2
            countYellow -= 1
            yellowLable.text = String(format: "%02d", countYellow)
            greenLable.text = ""
            if countYellow <= 0 {
                greenView.alpha = 0.2
                yellowView.alpha = 0.2
                redView.alpha = 1
                countRed -= 1
                redLable.text = String(format: "%02d", countRed)
                yellowLable.text = ""
                if countRed <= 0 {
                    greenView.alpha = 1
                    yellowView.alpha = 0.2
                    redView.alpha = 0.2
                    redLable.text = ""
                    countGreen = 30
                    countYellow = 3
                    countRed = 60
                }
            }
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    

}

