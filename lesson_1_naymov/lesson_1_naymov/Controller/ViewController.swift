import UIKit

class ViewController: UIViewController, LikeButtonTap {
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        installDataModel()
        setStyleView()
        registerXib()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func likeButtonTap(indexCell: Int) {
        posts[indexCell].likeCount += 1
        tableView.reloadData()
    }
    
    func registerXib(){
        tableView.register(SimpleTableViewCell.self)
        tableView.register(ImageTableViewCell.self)
        tableView.register(FavoriteTableViewCell.self)
    }
    
    func setStyleView() {
        self.tableView.backgroundColor = UIColor(red: 239/255, green: 244/255, blue: 250/255, alpha: 1)
    }
    
    func installDataModel() {
        posts = [
            Post(imageUser: UIImage(named: "user"), imagePost: nil, name: "Alex Naymov", date: "12:00 Uhr", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ", likeCount: 123, isFavorite:true),
            Post(imageUser: UIImage(named: "user"), imagePost: UIImage(named: "image"), name: "Vlad Petrov", date: "12:10 Uhr", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", likeCount: 12, isFavorite:false),
            Post(imageUser: UIImage(named: "user"), imagePost: nil, name: "Max Sitov", date: "12:11 Uhr", description: "Lorem ipsum dolor sit amet, consectetur adipiscing ", likeCount: 53, isFavorite:false)
        ]
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if posts[indexPath.row].isFavorite == true{
            let cell: FavoriteTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath)
            cell.setData(dataModel: posts[indexPath.row], indexCell: indexPath.row)
            cell.delagate = self
            return cell
        } else if posts[indexPath.row].imagePost == nil{
            let cell: ImageTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath)
            cell.setData(dataModel: posts[indexPath.row], indexCell: indexPath.row)
            cell.delagate = self
            return cell
        }
        else {
            let cell: SimpleTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath)
            cell.setData(dataModel: posts[indexPath.row], indexCell: indexPath.row)
            cell.delagate = self
            return cell
        }
    }
}
