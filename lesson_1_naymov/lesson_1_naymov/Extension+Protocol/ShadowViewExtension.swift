import UIKit

extension UIView {
    
    func setShadowView(){
        
        self.layer.cornerRadius = Constants.cornerRadiusView
        self.layer.shadowRadius = Constants.shadowRadiusView
        self.layer.shadowOpacity = Constants.opacityView
        self.layer.shadowOffset = CGSize(width: Constants.offsetViewZero, height: Constants.offsetViewZero)
        self.layer.shadowColor = Constants.colorShadow
        
    }
    
    func setCircleShadowView(){
        
        self.layer.cornerRadius = self.frame.width/Constants.cornerCircleRadiusView
        self.layer.shadowRadius = Constants.shadowRadiusView
        self.layer.shadowOpacity = Constants.opacityView
        self.layer.shadowOffset = CGSize(width: Constants.offsetView, height: Constants.offsetView)
        self.layer.shadowColor = Constants.colorShadow
        
    }
    
    func setCircle(corner:CGFloat){
        self.layer.cornerRadius = corner
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
}

