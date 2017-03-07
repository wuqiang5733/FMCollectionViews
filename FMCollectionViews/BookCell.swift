//
//  BookCell.swift
//  FMCollectionViews
//
//  Created by WuQiang on 2017/3/5.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var bookCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 给选中的元素添加背景色 , selectedBackgroundView 是类的一个属性
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor(red: 0.9, green: 0.6, blue: 0.6, alpha: 1)
    }
}
