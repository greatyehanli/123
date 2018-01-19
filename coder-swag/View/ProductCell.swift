//
//  ProductCell.swift
//  coder-swag
//
//  Created by 李耶罕 on 12/31/17.
//  Copyright © 2017 李耶罕. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleL: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func updateViews(product: Product)
    {
        productImage.image = UIImage(named: product.imageName)
        productTitleL.text = product.title
        productPrice.text = product.price
    }
}
