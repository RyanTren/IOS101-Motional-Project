import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // Set custom names for rows 0-2
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Push Day"
        case 1:
            cell.textLabel?.text = "Pull Day"
        case 2:
            cell.textLabel?.text = "Leg Day"
        default:
            break
        }
        
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.textLabel?.textColor = UIColor.black
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Example: Navigate to a new view controller based on the selected row
        switch indexPath.row {
        case 0, 1, 2:
            let detailViewController = DetailViewController()
            detailViewController.modalTransitionStyle = .flipHorizontal // Set the desired transition style
            navigationController?.pushViewController(detailViewController, animated: true)
        default:
            break
        }
    }
    
    private func fetchExercise(){
        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        
        let session = URLSession.shared.dataTask(with: request){ data, response, error in
            
            if let error = error {
                print("🚨 Request failed: \(error.localizedDescription)")
                return
            }
            
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("🚨 Server Error: response: \(String(describing: response))")
                return
            }
            
            
            guard let data = data else {
                print("🚨 No data returned from request")
                return
            }
            
            do{
                let decode = JSONDecoder()
                let dateFormatter = DateFormatter()
                
            }
        }
        
        session.resume()
    }
}
