//
//  ViewController.swift
//  tableView
//
//  Created by okokok on 06.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelUni: UILabel!
    
    @IBOutlet weak var labelLocation: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var labelInfo: UILabel!
     /*
    var uni = " "
    var location = " "
    var imagename = " "
    */
    
    var university = University()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelUni.text = university.uni
        labelLocation.text = university.location
        imageview.image = UIImage(named: university.imagename)
        labelYear.text = university.year
        labelInfo.text = university.info
        
        labelInfo.numberOfLines = 0
        labelInfo.adjustsFontSizeToFitWidth = true
        labelInfo.minimumScaleFactor = 0.5
       
        labelInfo.sizeToFit()
        
    }


}

