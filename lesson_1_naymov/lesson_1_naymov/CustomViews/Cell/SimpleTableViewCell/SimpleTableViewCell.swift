import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    @IBOutlet public weak var backgroundViewCellView: UIView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var dateMessageLabel: UILabel!
    @IBOutlet weak var countLikeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    weak var delagate: FavoriteProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyleForView()
    }
    private func setStyleForView() {
        backgroundViewCellView.setShadowView()
        userView.setCircleShadowView()
        userImageView.setCircle(corner: userView.frame.width/Constants.cornerCircleRadiusView)
    }
    
    @IBAction func likeTouchButton(_ sender: UIButton) {
        delagate?.likeButtonTap(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(dataModel: Post, indexCell: UITableViewCell) {
        guard let nameUsers = dataModel.name, let imageUsers = dataModel.imageUser,
        let datePost = dataModel.date, let descriptionPost = dataModel.description else {return}
        nameUserLabel.text = nameUsers
        userImageView.image = imageUsers
        dateMessageLabel.text = datePost
        countLikeLabel.text = String(dataModel.likeCount)
        messageLabel.text = descriptionPost
    }
    
}




