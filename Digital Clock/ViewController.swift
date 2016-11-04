//
//  ViewController.swift
//  Digital Clock
//
//  Created by Timothy Barrett on 11/1/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var clockColorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var backgroundSegmentedControl: UISegmentedControl!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        chooseClockColor()
        chooseBackgroundColor()
        settingsView.isHidden = true
        settingsButton.alpha = 0.25
        timeLabel.alpha = 0
        settingsButton.layer.cornerRadius = 10
        settingsView.layer.cornerRadius = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clockColorSegmentControlChosen(_ sender: Any) {
        
        chooseClockColor()
    }

    
    @IBAction func backgroundColorSegmentedControlChosen(_ sender: Any) {
        
        chooseBackgroundColor()
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        if settingsView.isHidden == true {
            
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: .normal)
            settingsButton.alpha = 1.0
            
        } else {
            
            settingsView.isHidden = true
            settingsButton.setTitle("Show Settings", for: .normal)
            settingsButton.alpha = 0.25
        }
    }
    
    
    
    func chooseClockColor() {
        
        switch clockColorSegmentedControl.selectedSegmentIndex {
        case 0:
            timeLabel.textColor = UIColor.white
        case 1:
            timeLabel.textColor = UIColor.black
        case 2:
            timeLabel.textColor = UIColor.red
        case 3:
            timeLabel.textColor = UIColor.green
        default:
            break
        }
        
    }
    
    func chooseBackgroundColor() {
        
        switch backgroundSegmentedControl.selectedSegmentIndex {
        case 0:
            timeLabel.backgroundColor = UIColor.black
        case 1:
            timeLabel.backgroundColor = UIColor.white
        case 2:
            timeLabel.backgroundColor = UIColor.yellow
        case 3:
            timeLabel.backgroundColor = UIColor.blue
        default:
            break
        }
    }
    
    func updateTimer() {
        
        let timeformatter = DateFormatter()
        
        timeformatter.timeStyle = .medium
        
        timeLabel.text = timeformatter.string(from: Date())
        
        timeLabel.alpha = 1.0
        
    }
    
}

