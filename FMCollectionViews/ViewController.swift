//
//  ViewController.swift
//  FMCollectionViews
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionItems: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionItems.dataSource = self
        collectionItems.backgroundColor = UIColor.white
        // 有向中间靠拢
        let layout = collectionItems.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 25, left: 20, bottom: 25, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionItems.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! BookCell
        let file = AppData.items[indexPath.item]
        cell.bookCover.image = UIImage(named: file)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let controller = segue.destination as! DetailViewController
            if let paths = collectionItems.indexPathsForSelectedItems {
                let selectedCell = paths[0].item
                controller.selected = selectedCell
            }
        }
    }
    // 去选择
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let paths = collectionItems.indexPathsForSelectedItems {
            for path in paths {
                collectionItems.deselectItem(at: path, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionItems.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "myHeader", for: indexPath) as! HeaderView
            headerView.headerTitle.text = "My Books"
            headerView.headerImage.image = UIImage(named: "gradientTop")
            return headerView
        case UICollectionElementKindSectionFooter:
            let footerView = collectionItems.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "myFooter", for: indexPath) as! FooterView
            footerView.footerImage.image = UIImage(named: "gradientBottom")
            return footerView
        default:
            assert(false, "Error")
        }
    }
}

