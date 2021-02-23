
import UIKit

class ImageTableViewCell: SimpleTableViewCell {
    
    
    @IBOutlet weak var boxImageView: UIView!{
        didSet{
            boxImageView.layer.cornerRadius = 10
            boxImageView.layer.shadowColor = UIColor.darkGray.cgColor
            boxImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
            boxImageView.layer.shadowRadius = 5
            boxImageView.layer.shadowOpacity = 0.2
        }
    }
    @IBOutlet weak var imageMessageImageView: UIImageView! {
        didSet{
            imageMessageImageView.layer.cornerRadius = 10
            imageMessageImageView.clipsToBounds = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setData(dataModel: Post, indexCell: Int) {
        super.setData(dataModel: dataModel, indexCell: indexCell)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
