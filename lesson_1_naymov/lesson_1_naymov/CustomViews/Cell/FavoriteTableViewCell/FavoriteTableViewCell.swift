import UIKit

class FavoriteTableViewCell: SimpleTableViewCell {
    
    @IBOutlet weak var boxFavoriteView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        boxFavoriteView.setCircle(corner: boxFavoriteView.frame.width/Constants.cornerCircleRadiusView)
    }
    
}
