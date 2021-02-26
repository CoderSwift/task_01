import UIKit

public extension UITableViewCell{

    var tableView:UITableView?{
        return superview as? UITableView
    }

    var indexPath:IndexPath?{
        return tableView?.indexPath(for: self)
    }
    
}
