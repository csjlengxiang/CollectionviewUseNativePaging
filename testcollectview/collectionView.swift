//
//  collectionView.swift
//  testcollectview
//
//  Created by chensijie on 15/8/20.
//  Copyright (c) 2015年 ledongli. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {

    // 扩展 CollectionView 的点击范围
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(CGRectInset(self.bounds, CGFloat(-collectionViewMargin), 0), point)
    }
}
