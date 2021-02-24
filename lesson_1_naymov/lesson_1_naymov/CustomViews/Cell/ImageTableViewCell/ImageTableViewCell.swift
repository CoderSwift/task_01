
import UIKit

class ImageTableViewCell: SimpleTableViewCell {
    
    
    @IBOutlet weak var boxView: UIView!{
        didSet{
            boxView.layer.cornerRadius = 10
            boxView.layer.shadowColor = UIColor.darkGray.cgColor
            boxView.layer.shadowOffset = CGSize(width: 5, height: 5)
            boxView.layer.shadowRadius = 5
            boxView.layer.shadowOpacity = 0.2
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
        imageMessageImageView.image = dataModel.imagePost
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
