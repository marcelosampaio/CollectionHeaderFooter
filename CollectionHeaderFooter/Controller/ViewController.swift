//
//  ViewController.swift
//  CollectionHeaderFooter
//
//  Created by Marcelo Sampaio on 02/04/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    // MARK: - Properties
    var source = [String]()
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...99 {
            source.append("i: \(i)")
        }
    }

    // MARK: - Collection View Data Source and Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.baseImageView.image = UIImage(named: "imgFundo")
        
        return cell
        
    }
    
    // suplementary views (header and footer)
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview = UICollectionReusableView()

        if kind == UICollectionView.elementKindSectionHeader {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeader", for: indexPath) as! CollectionHeaderView
            headerView.backgroundColor = UIColor.purple
            headerView.headerLabel.text = "This is the header"
            reusableview = headerView
        }
        
        if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionFooter", for: indexPath) as! CollectionFooterView
            footerView.backgroundColor = UIColor.yellow
            footerView.footerLabel.text = "This is the footer"
            reusableview = footerView
        }
        
        
        
        return reusableview
    }
    

}

