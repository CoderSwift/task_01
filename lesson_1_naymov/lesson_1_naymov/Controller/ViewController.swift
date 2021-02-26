import UIKit

class ViewController: UIViewController, FavoriteProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var posts: [Post] = []
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        installDataModel()
        registerXib()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func likeButtonTap(cell: UITableViewCell) {
        
        posts[cell.indexPath!.row].likeCount += 1
        tableView.reloadData()
        
    }
    
    private func registerXib(){
        
        tableView.register(cellType: SimpleTableViewCell.self)
        tableView.register(cellType: ImageTableViewCell.self)
        tableView.register(cellType: FavoriteTableViewCell.self)
        
    }

    private func installDataModel() {
        
        posts = [
            Post(imageUser: UIImage(named: "user"), imagePost: nil, name: "Alex Naymov", date: "12:00 Uhr", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ", likeCount: 123, isFavorite:true),
            Post(imageUser: UIImage(named: "user"), imagePost: UIImage(named: "image"), name: "Vlad Petrov", date: "12:10 Uhr", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", likeCount: 12, isFavorite:false),
            Post(imageUser: UIImage(named: "user"), imagePost: nil, name: "Max Sitov", date: "12:11 Uhr", description: "Lorem ipsum dolor sit amet, consectetur adipiscing ", likeCount: 53, isFavorite:false)
        ]
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var  cell = tableView.dequeueReusableCell(with: SimpleTableViewCell.self, for: indexPath)
            
        if posts[indexPath.row].isFavorite{
            cell = tableView.dequeueReusableCell(with: FavoriteTableViewCell.self, for: indexPath)
        } else if posts[indexPath.row].imagePost != nil {
            cell = tableView.dequeueReusableCell(with: ImageTableViewCell.self, for: indexPath)
        }
        
        cell.setData(dataModel: posts[indexPath.row], indexCell: cell)
        cell.delagate = self
        return cell
        
    }
}






