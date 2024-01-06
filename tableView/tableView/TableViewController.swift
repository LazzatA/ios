//
//  TableViewController.swift
//  tableView
//
//  Created by okokok on 06.01.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    //let array = [1, 2, 3, 4, 5]
    
    //var arrayUni = ["Nazarbayev University", "Al-Farabi KazNU", "Auezov University", "MNU KAZGUU", "AITU"]
    //var arrayLocation = ["Astana", "Almaty", "Shymkent", "Astana", "Astana" ]
    //var arrayImage = ["nu","kaznu", "tex", "mnu", "aitu"]
    
    var arrayUniversity = [University(uni: "Nazarbayev University", location: "Astana", imagename: "nu", year: "Since: 2010", info:"Nazarbayev University (NU) (Kazakhstan Nazarbayev University) is a higher educational institution in Astana, opened on the initiative of the First President of the Republic of Kazakhstan - N. A. Nazarbayev. Began accepting the first students in September 2010. Teaching is conducted entirely in English.The university is intended to become a national brand of higher education in Kazakhstan, combining the advantages of the national education system and the best global scientific and educational practices. The governing bodies of the university are the Executive Council, the Board of Trustees and the Supreme Council of Trustees. The Chairman of the Supreme Board of Trustees is the First President of the Republic of Kazakhstan - Nursultan Nazarbayev."),
                           University(uni: "Al-Farabi KazNU", location: "Almaty", imagename: "kaznu", year: "Since: 1934", info:"Al-Farabi Kazakh National University (Kazakhstan Al-Farabi atyndagy Kazak ulttyk university) is a leading multidisciplinary higher education institution in Kazakhstan.The leading higher education system of the higher education system of the Republic of Kazakhstan was the first to pass state certification and confirmed the right to justify educational activities in all specialties and levels[2]. Leader of the Highest Ranking of Universities of Kazakhstan, the first laureate of the Presidential Award of the Republic of Kazakhstan “For Achievements in the Field of Quality” in the history of the country, winner of the Prize of the Commonwealth of Independent States for achievements in the field of quality of products and services[2]."),
                           University(uni: "Auezov University", location: "Shymkent", imagename: "tex", year: "Since: 1967", info:"South Kazakhstan University named after. M. Auezova is a responsible and multidisciplinary university of the Republic of Kazakhstan, a scientific, educational, intellectual, cultural center of the region. The university provides consultations on preparation for all sectors of the economy, science and culture of the region, republic and international spaces."),
                           University(uni: "MNU KAZGUU", location: "Astana", imagename: "mnu", year: "Since: 1994", info:"Maksut Narikbayev University (formerly the Kazakh Humanitarian Law University, KAZGUU University named after M.S. Narikbayev) The university has 4 schools - the Higher School of Humanities (HSH), the Higher School of Law (HSL), the International School of Economics (ISE), the International School of Journalism . (MSJ) and Business School (Business School)."),
                           University(uni: "AITU", location: "Astana", imagename: "aitu", year: "Since: 2019", info:"Astana IT University is a leader in innovative continuous IT education and science with strong academic traditions and high social responsibility. University mission: Training of highly qualified personnel and commercialization of research for the ICT sector as drivers of the development of Kazakhstan.")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addUni(_ sender: Any) {
       /* arrayUni.append("new university")
        arrayLocation.append("new location")
        arrayImage.append("avatar") */
        
        arrayUniversity.append(University(uni: "new university", location: "new location", imagename: "avatar", year: "new year", info: "new information"))
        
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayUniversity.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)


        let label =  cell.viewWithTag(1000) as! UILabel
        label.text = arrayUniversity[indexPath.row].uni
        
        let labelLoocation =  cell.viewWithTag(1001) as! UILabel
        labelLoocation.text = arrayUniversity[indexPath.row].location
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayUniversity[indexPath.row].imagename)
        
        let labelYear = cell.viewWithTag(1005) as! UILabel
        labelYear.text = arrayUniversity[indexPath.row].year
        
        let labelInfo = cell.viewWithTag(1006) as! UILabel
        labelInfo.text = arrayUniversity[indexPath.row].info
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        /*
        detailVC.uni = arrayUniversity[indexPath.row].uni
        detailVC.location = arrayUniversity[indexPath.row].location
        detailVC.imagename = arrayUniversity[indexPath.row].imagename
        */
        
        detailVC.university = arrayUniversity[indexPath.row]
        
        navigationController?.show(detailVC, sender: self)
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
           /*
            arrayUni.remove(at: indexPath.row)
            arrayLocation.remove(at: indexPath.row)
            arrayImage.remove(at: indexPath.row)
            */
            
            arrayUniversity.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
