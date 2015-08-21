//
//  CollectionViewCell.swift
//  testcollectview
//
//  Created by chensijie on 15/8/19.
//  Copyright (c) 2015年 ledongli. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        
        var realCell = UIView()
        realCell.backgroundColor = UIColor(red: 1, green: 0, blue: 1, alpha: 0.2)
        
        self.contentView.addSubview(realCell)
        var margin = CGFloat(collectionViewCellMargin)
        realCell.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsets(top: 0,left: margin, bottom: 0,right: margin))
        }
        
        //self.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    }
    
    // 缩小cell的范围
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(CGRectInset(self.bounds, CGFloat(collectionViewCellMargin), 0), point)
    }
}
