import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textLocation: UITextField!
    @IBOutlet weak var textNews: UITextField!

    @IBAction func add(_ sender: Any) {
        let defaults = UserDefaults.standard

        let uniName = textName.text!
        let uniLocation = textLocation.text!
        let uniNews = textNews.text!

        var newUniversityItem = NewsItem(name: "", location: "", news: "")
        newUniversityItem.name = uniName
        newUniversityItem.location = uniLocation
        newUniversityItem.news = uniNews
        newUniversityItem.date = Date() // Set the current date

        do {
            if var array = try? JSONDecoder().decode([NewsItem].self, from: defaults.data(forKey: "uniItemArray") ?? Data()) {
                //array.append(newUniversityItem)
                array.insert(newUniversityItem, at: 0)
                

                // Encode the array including the Date property
                if let encodedata = try? JSONEncoder().encode(array) {
                    defaults.set(encodedata, forKey: "uniItemArray")
                }

                // Reload the table view if you want to reflect the changes immediately
                if let tabBarController = self.tabBarController {
                    if let tableViewController = tabBarController.viewControllers?[0] as? TableViewController {
                        tableViewController.arrayUni = array
                        tableViewController.tableView.reloadData()
                    }
                }

            } else {
                // If no array exists in UserDefaults, create a new one with the new item
                let encodedata = try JSONEncoder().encode([newUniversityItem] as [NewsItem]) // Explicitly specify the type
                defaults.set(encodedata, forKey: "uniItemArray")
            }

        } catch {
            print("Unable to encode/decode: \(error)")
        }

        // Clear text fields after adding the data
        textName.text = ""
        textLocation.text = ""
        textNews.text = ""
    }

    
}



///
///
///
///
///
////  ViewController.swift
////  newsDate
////
////  Created by okokok on 22.01.2024.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//
//    @IBOutlet weak var textName: UITextField!
//    @IBOutlet weak var textLocation: UITextField!
//    @IBOutlet weak var textNews: UITextField!
//
//
//    @IBAction func add(_ sender: Any) {
//        let defaults = UserDefaults.standard
//
//        let uniName = textName.text!
//        let uniLocation = textLocation.text!
//        let uniNews = textNews.text!
//
//        var newUniversityItem = NewsItem()
//        newUniversityItem.name = uniName
//        newUniversityItem.location = uniLocation
//        newUniversityItem.news = uniNews
//        newUniversityItem.date = Date() // Set the current date
//
//
//
//        do {
//                    if var array = try? JSONDecoder().decode([NewsItem].self, from: defaults.data(forKey: "uniItemArray") ?? Data()) {
//                        array.append(newUniversityItem)
//
//                        // Save the updated array back to UserDefaults
//                        if let encodedata = try? JSONEncoder().encode(array) {
//                            defaults.set(encodedata, forKey: "uniItemArray")
//                        }
//
//                        // Reload the table view if you want to reflect the changes immediately
//                        if let tabBarController = self.tabBarController {
//                            if let tableViewController = tabBarController.viewControllers?[0] as? TableViewController {
//                                tableViewController.arrayUni = array
//                                tableViewController.tableView.reloadData()
//                            }
//                        }
//
//                    } else {
//                        // If no array exists in UserDefaults, create a new one with the new item
//                        let encodedata = try JSONEncoder().encode([newUniversityItem])
//                        defaults.set(encodedata, forKey: "uniItemArray")
//                    }
//
//                } catch {
//                    print("Unable to encode/decode: \(error)")
//                }
////        do{
////            if var array = try?JSONDecoder().decode([NewsItem].self, from:defaults.data(forKey: "uniItemArray") ?? Data()){
////                array.append(newUniversityItem)
////
////                // Save the updated array back to UserDefaults
////                if let encodedata = try? JSONEncoder().encode(array) {
////                    defaults.set(encodedata, forKey: "uniItemArray")
////                }
////
////
////                // Reload the table view if you want to reflect the changes immediately
////                if let tabBarController = self.tabBarController {
////                    if let tableViewController = tabBarController.viewControllers?[0] as? TableViewController {
////                        tableViewController.arrayUni = array
////                        tableViewController.tableView.reloadData()
////                    }
////                }
////
////            } else {
////                // If no array exists in UserDefaults, create a new one with the new item
////                let encodedata = try JSONEncoder().encode([newUniversityItem])
////                defaults.set(encodedata, forKey: "uniItemArray")
////            }
////
////        } catch {
////            print("Unable to encode/decode: \(error)")
////        }
//
//        // Clear text fields after adding the data
//        textName.text = ""
//        textLocation.text = ""
//        textNews.text = ""
//
//
//
//
//
//        func viewDidLoad() {
//            super.viewDidLoad()
//            // Do any additional setup after loading the view.
//        }
//
//
//    }
//
//}
//
