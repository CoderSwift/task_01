
import UIKit

class ImageTableViewCell: SimpleTableViewCell {
    
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var imageMessageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        boxView.setShadowView()
        imageMessageImageView.setCircle(corner: 10)
    }
    
    override func setData(dataModel: Post, indexCell: UITableViewCell) {
        super.setData(dataModel: dataModel, indexCell: indexCell)
        imageMessageImageView.image = dataModel.imagePost
    }
}
