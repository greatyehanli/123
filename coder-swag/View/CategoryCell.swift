//
//  CategoryCell.swift
//  coder-swag
//
//  Created by 李耶罕 on 12/29/17.
//  Copyright © 2017 李耶罕. All rights reserved.
//
//每次用Table view cell都要建立一个Tabel View cell的class
import UIKit

class CategoryCell: UITableViewCell {

    //把TableViewCell的cell里的image和title用代码联系了起来，然后每次想要个新的cell就有模版了
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    //每次想pass一个新的catefory我们都要call这个然后这个func更新view
    func updateViews(category: Category) { //category是这个parameters的名字，Category是type，你call这个func的时候也有这个名字
        //category是parameter
        categoryImage.image = UIImage(named: category.imageName) //image指的是TableViewCell里的那个image,然后把图片名字给它
        categoryTitle.text = category.title // 同上道理
    }

}
