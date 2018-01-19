//
//  Category.swift
//  coder-swag
//
//  Created by 李耶罕 on 12/29/17.
//  Copyright © 2017 李耶罕. All rights reserved.
//

import Foundation

struct Category {
    //public 表示只的是哪儿都可以用，但是Set只能private的set
    private(set) public var title: String!
    private(set) public var imageName: String!
    
    init(title: String, imageName: String) //constructor with parameters
    {
        //self就相等于c++的this.
        //self指的是这个struct／这个class它自身
        self.title = title
        self.imageName = imageName
    }
}
