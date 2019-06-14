
import Foundation
import UIKit

extension UICollectionView{
    
    func checkForNoData(count:Int,strMessage : String,color : UIColor = getThemeColor()){
        
        
        if count > 0 {
            self.backgroundView = nil;
        }else{
            let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
            noDataLabel.text          = strMessage
            noDataLabel.textColor     = color
            noDataLabel.textAlignment = .center
            noDataLabel.font =  UIFont.init(name: Font.FontName.ProximaNova_Semibold.rawValue, size: 16)
            self.backgroundView = noDataLabel;
        }
    }

}

