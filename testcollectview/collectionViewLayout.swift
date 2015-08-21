//
//  collectionViewLayout.swift
//  testcollectview
//
//  Created by csj on 15/8/19.
//  Copyright (c) 2015年 ledongli. All rights reserved.
//

import UIKit

class collectionViewLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {
    
    
    override init() {
        super.init()
        
        var weight = UIScreen.mainScreen().bounds.width
        
        var lineSpac: CGFloat = CGFloat(lineSpacing)
        
        var margin = CGFloat(collectionViewMargin)
        
        self.itemSize = CGSize(width: weight - lineSpac * 2 - margin * 2, height: weight - lineSpac * 2 - margin * 2)
        
        self.sectionInset = UIEdgeInsets(top: 0, left: lineSpac, bottom: 0, right: lineSpac)
        
        self.minimumLineSpacing = lineSpac * 2
        
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
