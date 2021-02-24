import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    @IBOutlet public weak var backgroundViewCellView: UIView!{
        didSet{
            backgroundViewCellView.layer.cornerRadius = 15
            backgroundViewCellView.clipsToBounds = true
            backgroundViewCellView.layer.masksToBounds = false
            backgroundViewCellView.layer.shadowRadius = 5
            backgroundViewCellView.layer.shadowOpacity = 0.1
            backgroundViewCellView.layer.shadowOffset = CGSize(width: 0, height: 0)
            backgroundViewCellView.layer.shadowColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var userView: UIView!{
        didSet{
            userView.layer.cornerRadius = userImageView.frame.width/2
            userView.layer.shadowColor = UIColor.darkGray.cgColor
            userView.layer.shadowOffset = CGSize(width: 10, height: 10)
            userView.layer.shadowRadius = 8
            userView.layer.shadowOpacity = 0.2
        }
    }
    @IBOutlet weak var userImageView: UIImageView! {
        didSet{
            userImageView.layer.cornerRadius = userImageView.frame.width/2
            userImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameUserLabel: UILabel!
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
        nameUserLabel.text = nameUsers
        userImageView.image = imageUsers
        dateMessageLabel.text = datePost
        countLikeLabel.text = String(dataModel.likeCount)
        messageLabel.text = descriptionPost
        self.indexCell = indexCell
    }
    
}
