//
//  SecondViewController.swift
//  timer
//
//  Created by okokok on 15.01.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var time = 0
    
    var startTime = 0
    
    var timer = Timer()
    
    var isTimerRunning = false
    

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTime = time
        
        label.text = timeToString(intTime: time)

        // Do any additional setup after loading the view.
    }
    
    @objc func countTime(){
        time -= 1
        label.text = timeToString(intTime: time)
        
        if time == 0 {
            timer.invalidate()
        }
    }
    

    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
     }
    
    
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        time = startTime
        isTimerRunning = false
        label.text = timeToString(intTime: time)
    }
    
    func timeToString(intTime: Int) -> String {
        let secunds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, secunds) // 00:00:00
        
        
    }
    /*

     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
