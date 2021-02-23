import UIKit

class FavoriteTableViewCell: SimpleTableViewCell {
    
    @IBOutlet weak var boxFavoriteView: UIView! {
        didSet{
            boxFavoriteView.layer.cornerRadius = boxFavoriteView.frame.width/2
            boxFavoriteView.layer.shadowColor = UIColor.darkGray.cgColor
            boxFavoriteView.layer.shadowOffset = CGSize(width: 5, height: 5)
            boxFavoriteView.layer.shadowRadius = 8
            boxFavoriteView.layer.shadowOpacity = 0.2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
