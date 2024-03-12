//
//  ModalViewController.swift
//  Delegate
//
//  Created by okokok on 11.03.2024.
//

import UIKit

protocol SelectCategoryProtocol{
    func setCategory(_ category: String)
}

class ModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
  

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    
    var delegate: SelectCategoryProtocol?
    
    var categoryArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        
        if categoryArray.count * 44 < Int(view.frame.height - topConstraint.constant - bottomConstraint.constant){
            let constraintValue = (view.frame.height - CGFloat(categoryArray.count * 44)) / 2
            
            
            topConstraint.constant = constraintValue
            bottomConstraint.constant = constraintValue
        }
        
        tableview.layer.cornerRadius = 8
    }
    
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool{
        if (touch.view?.isDescendant(of: tableview))!{
            return false
        }
        return true
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = categoryArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setCategory(categoryArray[indexPath.row])
        
        dismissView()
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
