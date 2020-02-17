//
//  UIScrollView.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension UIScrollView{
    
    func AumaticScroller() {
        var contentRect = CGRect.zero
        for view in self.subviews{
            contentRect = contentRect.union(view.frame);
        }
        self.contentSize = contentRect.size;
    }
    
    func AumaticScrollerFaxible() {
        var contentRect = CGRect.zero
        for view in self.subviews{
            contentRect = contentRect.union(view.frame);
        }
        self.contentSize = CGSize(width: contentRect.width, height: contentRect.height + 60)
    }
}
