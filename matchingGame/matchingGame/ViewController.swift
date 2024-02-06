//
//  ViewController.swift
//  matchingGame
//
//  Created by okokok on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    
    
    
    var images = [
        "butter",
        "c",
        "d",
        "e",
        "g",
        "rubbit",
        "uni",
        "tiger",
        "butter",
        "c",
        "d",
        "e",
        "g",
        "rubbit",
        "uni",
        "tiger"
    ]
    
    var buttons = [UIButton]( )
    
    var click = 1
    
    var click1 = 0
    var click2 = 0
    
    var points1 = 0
    var points2 = 0
    
    var player = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        images.shuffle()//shuffle images
        
        //add buttons to an array
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)
        buttons.append(button10)
        buttons.append(button11)
        buttons.append(button12)
        buttons.append(button13)
        buttons.append(button14)
        buttons.append(button15)
        buttons.append(button16)
        
        
        
        
        
    }
    
    @IBAction func button1(_ sender: UIButton) {
        if click == 1 {
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 2
            click1 = 1
        }else if click == 2{
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 1
            click2 = 1
            
            compare()
        }
    }
    
    @IBAction func button2(_ sender: UIButton) {
        if click == 1 {
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 2
            click1 = 2
        }else if click == 2{
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 1
            click2 = 2
            
            compare()
            
        }
    }
    
    @IBAction func button3(_ sender: UIButton) {
        if click == 1 {
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 2
            click1 = 3
        }else if click == 2{
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 1
            click2 = 3
            
            compare()
            
        }
    }
    
    @IBAction func button4(_ sender: UIButton) {
        if click == 1 {
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 2
            click1 = 4
        }else if click == 2{
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 1
            click2 = 4
            
            compare()
            
        }
    }
    
    @IBAction func button5(_ sender: UIButton) {
        if click == 1 {
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 2
            click1 = 5
        }else if click == 2{
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 1
            click2 = 5
            
            compare()
            
        }
    }
    
    
    @IBAction func button6(_ sender: UIButton) {
        if click == 1 {
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 2
            click2 = 6
        }else if click == 2{
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 1
            click2 = 6
            
            compare()
            
        }
    }
    
    
    @IBAction func button7(_ sender: UIButton) {
        if click == 1 {
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 2
            click2 = 7
        }else if click == 2{
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 1
            click2 = 7
            
            compare()
            
        }
    }
    
    @IBAction func button8(_ sender: UIButton) {
        if click == 1 {
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 2
            click2 = 8
        }else if click == 2{
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 1
            click2 = 8
            
            compare()
            
        }
    }
    
    @IBAction func button9(_ sender: UIButton) {
        if click == 1 {
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 2
            click2 = 9
        }else if click == 2{
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 1
            click2 = 9
            
            compare()
            
        }
    }
    
    
    @IBAction func button10(_ sender: UIButton) {
        if click == 1 {
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 2
            click2 = 10
        }else if click == 2{
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 1
            click2 = 10
            
            compare()
            
        }
    }
    
    @IBAction func button11(_ sender: UIButton) {
        if click == 1 {
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 2
            click2 = 11
        }else if click == 2{
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 1
            click2 = 11
            
            compare()
            
        }
    }
    
    
    @IBAction func button12(_ sender: UIButton) {
        if click == 1 {
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 2
            click2 = 12
        }else if click == 2{
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 1
            click2 = 12
            
            compare()
            
        }
    }
    
    @IBAction func button13(_ sender: UIButton) {
        if click == 1 {
            button13.setImage(UIImage(named: images[12]), for: .normal)
            click = 2
            click2 = 13
        }else if click == 2{
            button13.setImage(UIImage(named: images[12]), for: .normal)
            click = 1
            click2 = 13
            
            compare()
            
        }
    }
    
    
    @IBAction func button14(_ sender: UIButton) {
        if click == 1 {
            button14.setImage(UIImage(named: images[13]), for: .normal)
            click = 2
            click2 = 14
        }else if click == 2{
            button14.setImage(UIImage(named: images[13]), for: .normal)
            click = 1
            click2 = 14
            
            compare()
            
        }
        
    }
    
    @IBAction func button15(_ sender: UIButton) {
        if click == 1 {
            button15.setImage(UIImage(named: images[14]), for: .normal)
            click = 2
            click2 = 15
        }else if click == 2{
            button15.setImage(UIImage(named: images[14]), for: .normal)
            click = 1
            click2 = 15
            
            compare()
            
        }
    }
    
    @IBAction func button16(_ sender: UIButton) {
        if click == 1 {
            button16.setImage(UIImage(named: images[15]), for: .normal)
            click = 2
            click2 = 16
        }else if click == 2{
            button16.setImage(UIImage(named: images[15]), for: .normal)
            click = 1
            click2 = 16
            
            compare()
            
        }
    }
    
    func compare(){
        
        if images[click1 - 1] == images[click2 - 1]{
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                self.buttons[self.click1-1].alpha = 0
                self.buttons[self.click2-1].alpha = 0
                
                
                if self.player == 1{
                    self.points1 = self.points1 + 1
                    self.player1.text = "Player 1: \(self.points1)"
                }else if self.player == 2{
                    self.points2 = self.points2 + 1
                    self.player2.text = "Player 2: \(self.points2)"
                }
                
                self.switchPlayer()
                
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                self.buttons[self.click1-1].setImage(UIImage(named: "default"), for: .normal)
                self.buttons[self.click2-1].setImage(UIImage(named: "default"), for: .normal)}
            
            self.switchPlayer()
        }
        
    }
    
    func switchPlayer(){
        if player == 1 {
            player = 2
            player1.textColor = .gray
            player2.textColor = .black
        }else {
            player = 1
            player1.textColor = .black
            player2.textColor = .gray
        }
    }
    

    
    
}

