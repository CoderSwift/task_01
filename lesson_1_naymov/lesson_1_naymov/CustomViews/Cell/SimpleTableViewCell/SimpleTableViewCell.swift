import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    @IBOutlet public weak var backgroundViewCell: UIView!{
        didSet{
            backgroundViewCell.layer.cornerRadius = 15
            backgroundViewCell.clipsToBounds = true
            backgroundViewCell.layer.masksToBounds = false
            backgroundViewCell.layer.shadowRadius = 5
            backgroundViewCell.layer.shadowOpacity = 0.1
            backgroundViewCell.layer.shadowOffset = CGSize(width: 0, height: 0)
            backgroundViewCell.layer.shadowColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var userImageBox: UIView!{
        didSet{
            userImageBox.layer.cornerRadius = userImage.frame.width/2
            userImageBox.layer.shadowColor = UIColor.darkGray.cgColor
            userImageBox.layer.shadowOffset = CGSize(width: 10, height: 10)
            userImageBox.layer.shadowRadius = 8
            userImageBox.layer.shadowOpacity = 0.2
        }
    }
    @IBOutlet weak var userImage: UIImageView! {
        didSet{
            userImage.layer.cornerRadius = userImage.frame.width/2
            userImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var dateMessageLabel: UILabel!
    @IBOutlet weak var countLikeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var indexCell: Int?
    weak var delagate: LikeButtonTap?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeTouchButton(_ sender: UIButton) {
        guard let indexCell = indexCell else {return}
        delagate?.likeButtonTap(indexCell: indexCell)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(dataModel: Post, indexCell: Int) {
        guard let nameUsers = dataModel.name else {return}
        guard let imageUsers = dataModel.imageUser else {return}
        guard let datePost = dataModel.date else {return}
        guard let descriptionPost = dataModel.description else {return}
        nameUser.text = nameUsers
        userImage.image = imageUsers
        dateMessageLabel.text = datePost
        countLikeLabel.text = String(dataModel.likeCount)
        messageLabel.text = descriptionPost
        self.indexCell = indexCell
    }
    
}
