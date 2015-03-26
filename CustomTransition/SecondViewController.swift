//
//  SecondViewController.swift
//  CustomTransition
//
//  Created by Ackshaey Singh on 3/25/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var cView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cView.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "com.ackshaey.cell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //
        return 20;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return 3;
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("com.ackshaey.cell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        return cell
    }

}
