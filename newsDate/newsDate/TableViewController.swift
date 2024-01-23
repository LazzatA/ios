//
//  TableViewController.swift
//  newsDate
//
//  Created by okokok on 22.01.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayUni: [NewsItem] = [ ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
            let defaults = UserDefaults.standard
            
            do{
                if let data = defaults.data(forKey: "uniItemArray"){
                    let array = try JSONDecoder().decode([NewsItem].self, from: data)
                    arrayUni = array
                }
                
            } catch {
                print("unable to encode \(error)")
                
            }
        
        tableView.reloadData()
            
        }
    
    func saveTasks(){
        let defaults = UserDefaults.standard
        
        do{
            
            let encodedata = try JSONEncoder().encode(arrayUni)
            defaults.set(encodedata, forKey: "uniItemArray")
            
            
        } catch {
            print("unable to encode \(error)")
            
        }
        
        tableView.reloadData()
    }
        
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayUni.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            let label = cell.viewWithTag(1000) as! UILabel
            label.text = arrayUni[indexPath.row].name

            let labelLocation = cell.viewWithTag(1001) as! UILabel
            labelLocation.text = arrayUni[indexPath.row].location

            let labelInfo = cell.viewWithTag(1002) as! UILabel
            labelInfo.text = arrayUni[indexPath.row].news

            let labelDate = cell.viewWithTag(1003) as! UILabel
            labelDate.text = formattedDateString(from: arrayUni[indexPath.row].date)

            return cell
        }
    
    func formattedDateString(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()

        let components = calendar.dateComponents([.second, .minute, .hour, .day], from: date, to: now)

        if let days = components.day, days > 0 {
            return "\(days) \(days == 1 ? "day" : "days") ago"
        } else if let hours = components.hour, hours > 0 {
            return "\(hours) \(hours == 1 ? "hour" : "hours") ago"
        } else if let minutes = components.minute, minutes > 0 {
            return "\(minutes) \(minutes == 1 ? "minute" : "minutes") ago"
        } else if let seconds = components.second, seconds > 0 {
            return "\(seconds) \(seconds == 1 ? "second" : "seconds") ago"
        } else {
            return "Just now"
        }
    }


   /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let label =  cell.viewWithTag(1000) as! UILabel
        label.text = arrayUni[indexPath.row].name
        
        let labelLoocation =  cell.viewWithTag(1001) as! UILabel
        labelLoocation.text = arrayUni[indexPath.row].location
        
        let labelInfo = cell.viewWithTag(1002) as! UILabel
        labelInfo.text = arrayUni[indexPath.row].news

        // Configure the cell...

        return cell
    }
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayUni.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            saveTasks()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //show details in next view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! SecondViewController
            
            detailVC.university = arrayUni[indexPath.row]
            
            navigationController?.show(detailVC, sender: self)
            
            saveTasks()
            tableView.reloadData()
        }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
