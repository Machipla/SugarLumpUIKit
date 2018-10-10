//
//  ScrollView+Scroll.swift
//  Pods
//
//  Created by Mario Chinchilla on 31/5/17.
//
//

import Foundation

public extension UIScrollView {
    
    func scrollTo(subview:UIView, animated: Bool) {
        guard let origin = subview.superview else { return }
        
        let childStartPoint:CGPoint = origin.convert(subview.frame.origin, to: self)
        var toScrollFrame:CGRect = CGRect.zero
        toScrollFrame.origin.x = possibleScrollDirections.contains(.horizontal) ? childStartPoint.x : 0
        toScrollFrame.origin.y = possibleScrollDirections.contains(.vertical) ? childStartPoint.x : 0
        toScrollFrame.size.width = possibleScrollDirections.contains(.horizontal) ? frame.width : 1
        toScrollFrame.size.height = possibleScrollDirections.contains(.vertical) ? frame.height : 1

        self.scrollRectToVisible(toScrollFrame, animated: animated)
    }
    
    func scrollToTop(animated: Bool) {
        var topOffset:CGPoint = CGPoint.zero
        topOffset.y = possibleScrollDirections.contains(.vertical) ? -contentInset.top : 0
        topOffset.x = possibleScrollDirections.contains(.horizontal) ? -contentInset.top : 0

        setContentOffset(topOffset, animated: animated)
    }
    
    func scrollToBottom() {
        var bottomOffset:CGPoint = CGPoint.zero
        bottomOffset.y = possibleScrollDirections.contains(.vertical) ? contentSize.height - bounds.size.height + contentInset.bottom : 0
        bottomOffset.x = possibleScrollDirections.contains(.horizontal) ? contentSize.width - bounds.size.width + contentInset.right : 0
        if bottomOffset.y > 0 || bottomOffset.x > 0{
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
