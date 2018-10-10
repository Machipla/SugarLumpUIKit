//
//  UITableView+HeaderFooterView.swift
//  Alamofire
//
//  Created by Mario Plaza on 7/9/18.
//

import Foundation
import UIKit

public extension UITableView {
    public func layoutTableHeaderView(){
        guard let tableHeaderView = tableHeaderView else { return }
        setAndLayoutTableHeaderView(tableHeaderView)
    }
    
    public func setAndLayoutTableHeaderView(_ headerView: UIView) {
        self.tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerWidth = headerView.bounds.size.width;
        let temporaryWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "[headerView(width)]",
                                                                       options: NSLayoutFormatOptions(rawValue: UInt(0)),
                                                                       metrics: ["width": headerWidth],
                                                                       views: ["headerView": headerView])
        
        headerView.addConstraints(temporaryWidthConstraints)
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        var frame = headerView.frame
        frame.size.height = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        headerView.frame = frame
        
        self.tableHeaderView = headerView
        
        headerView.removeConstraints(temporaryWidthConstraints)
        headerView.translatesAutoresizingMaskIntoConstraints = true
        
    }
}
