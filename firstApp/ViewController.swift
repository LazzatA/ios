//
//  ViewController.swift
//  firstApp
//
//  Created by okokok on 21.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touched(_ sender: Any) {
        
        let a = textfield.text!
        let b = textfield2.text!
        let sum = Int(a)! + Int(b)!
        
        label.text = "sum = \(sum)"


    }
    
    @IBAction func multiplication(_ sender: Any) {
        let a = textfield.text!
        let b = textfield2.text!
        let mult = Int(a)! * Int(b)!
        
        label.text = "multiplication = \(mult)"
    }
    
    @IBAction func division(_ sender: Any) {
        let a = textfield.text!
        let b = textfield2.text!
        let div = Int(a)! / Int(b)!
        
        label.text = "division = \(div)"
    }
    
    @IBAction func minus(_ sender: Any) {
        let b = textfield2.text!
        let a = textfield.text!
        
        let min = Int(a)! - Int(b)!
        
        label.text = "subtraction = \(min)"
    }
}

