//
//  ProductVC.swift
//  coder-swag
//
//  Created by 李耶罕 on 12/31/17.
//  Copyright © 2017 李耶罕. All rights reserved.
//

import UIKit

class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var productsCollection: UICollectionView!
    
    private(set) public var products = [Product]() //防止nil发生，collectionView 不会找不到products然后崩掉了
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsCollection.dataSource = self
        productsCollection.delegate = self
        //productsCollection成为这些protocols的代表了
        //不要忘了把tableView和CollectionView的dataSource和delegate设一下，要不不运行
    }

    
    func initProducts(category: Category) { //这个parameter是从CategoriesVC得来的
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title //设那个navigation bar的title 为product的title
    }
    
    //这些protocol func都会自动运行
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    //indexPath会自动把这个array的所有products过一遍
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell //和tableView那个道理一样
        {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        } else {
            return ProductCell()
        }
    }


}
