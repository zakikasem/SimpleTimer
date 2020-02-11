//
//  ViewController.swift
//  SimpleTimer
//
//  Created by zaki kasem on 1/13/20.
//  Copyright © 2020 zaki kasem. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    var totalSec:Float = 0
    var timer = Timer()
    var labTimerArray = [String]()
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startBttn: UIButton!
    @IBOutlet weak var stopBttn: UIButton!
    @IBOutlet weak var lapBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "Tap Start"
        roundedBttnWithShadow(Bttn: startBttn)
        roundedBttnWithShadow(Bttn: stopBttn)
        roundedBttnWithShadow(Bttn: lapBttn)

 
      
    }

    @IBAction func startBttn(_ sender: Any) {
    timer = Timer.scheduledTimer(timeInterval: 0.01, target: self , selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        
        print("start tapped")
    }
    
    @IBAction func stopBttn(_ sender: Any) {
        timer.invalidate()
        print("stop tapped")
    }
    
    @IBAction func labBttn(_ sender: Any) {
        let totalSecMulti100 : Int = Int(totalSec * 100)
        labTimerArray.append(timerLabel.text!)
        tableView.reloadData()
        print("lap tapped")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labTimerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell")
        cell?.textLabel?.text = labTimerArray[indexPath.row]
        return cell!
    }
    
    @objc func updateTimer() {
        
        totalSec += 0.01
        let totalSecMulti100 : Int = Int(totalSec * 100)
        let min = Int(totalSec/60)
        let hour = Int(min/60)
        let minStr = (min == 0) ? "00" : "\(min)"
        let hourStr = (hour == 0) ? "00" : "\(hour)"
        let secStr = (totalSec < 9) ? "0\(Float(totalSecMulti100)/100)":"\(Float(totalSecMulti100)/100)"

        timerLabel.text = "\(hourStr):\(minStr):\(secStr)"
    }
    
    func roundedBttnWithShadow(Bttn: UIButton) {
        Bttn.layer.cornerRadius = Bttn.frame.size.height/2
        Bttn.layer.shadowColor = UIColor.black.cgColor
        Bttn.layer.shadowRadius = 2
        Bttn.layer.shadowOpacity = 0.5
        Bttn.layer.shadowOffset = CGSize(width: 0.0 , height: 2.0)
    }
}
    
   
