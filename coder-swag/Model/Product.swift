//
//  Product.swift
//  coder-swag
//
//  Created by 李耶罕 on 12/31/17.
//  Copyright © 2017 李耶罕. All rights reserved.
//

import Foundation
struct Product {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    init(title: String, price: String, imageName: String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
