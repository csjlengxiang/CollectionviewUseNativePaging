//
//  ViewController.swift
//  testcollectview
//
//  Created by chensijie on 15/8/19.
//  Copyright (c) 2015年 ledongli. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var cv: CollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cv = CollectionView(frame: CGRectZero, collectionViewLayout: collectionViewLayout())
        
        cv.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        cv.delegate = self
        cv.dataSource = self
        cv.pagingEnabled = true
        
        cv.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)
        //cv.backgroundColor = UIColor.clearColor()
        cv.clipsToBounds = false
        self.view.addSubview(cv)
        
        var margin = CGFloat(collectionViewMargin)
        cv.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 100,left: margin,bottom: 100,right: margin))
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        //cell.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath)
        
        var cellNow = cv.cellForItemAtIndexPath(indexPath)
        
        var cellPre = cv.cellForItemAtIndexPath(NSIndexPath(forRow: indexPath.row - 1, inSection: indexPath.section))
        
        var cellNext = cv.cellForItemAtIndexPath(NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section))
        
        anni(cellPre, isPre: true)
        
        anni(cellNext, isPre: false)
    }
    
    func anni (cellPre: UICollectionViewCell?, isPre: Bool) {
        
        if cellPre != nil {
            
            var centerPre = cellPre!.center
            
            var ncenterPre = CGPoint(x: centerPre.x + 20 * (isPre ? 1 : -1), y: centerPre.y)
            
            UIView.animateWithDuration(1, animations: { () -> Void in
                
                cellPre?.center = ncenterPre
                
                }, completion: { (finish) -> Void in
                    
                    UIView.animateWithDuration(1, animations: { () -> Void in
                    
                        cellPre?.center = centerPre
                    
                    })
            })
        }
    }
    
}
