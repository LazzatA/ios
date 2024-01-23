import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var labelNews: UILabel!
    
    var university = NewsItem(name: "", location: "", news: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        labelName.text = university.name
        labelLocation.text = university.location
        labelNews.text = university.news

        // Format and display the date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        labelDate.text = formatter.string(from: university.date)

        // Set the image if available
        if !university.imageName.isEmpty {
            imageview.image = UIImage(named: university.imageName)
        }
    }
}

