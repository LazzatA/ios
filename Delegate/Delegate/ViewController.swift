//
//  ViewController.swift
//  Delegate
//
//  Created by okokok on 11.03.2024.
//

import UIKit

class ViewController: UIViewController, SelectCategoryProtocol {
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openModalView(_ sender: Any) {
        let modalview = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        
        modalview.modalPresentationStyle = .overCurrentContext
        
        modalview.categoryArray = ["Food", " Clothing", "Electronics", " Other"]
        
        modalview.delegate = self
         
        present(modalview, animated: true, completion: nil)
    }
    
    @IBOutlet weak var categoryButton: UIButton!
    
    func setCategory(_ category: String) {
        categoryButton.setTitle(category, for: .normal)
    }
    
}

