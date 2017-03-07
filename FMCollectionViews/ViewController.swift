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
}

