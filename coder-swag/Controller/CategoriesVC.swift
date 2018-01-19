//
//  ViewController.swift
//  coder-swag
//
//  Created by 李耶罕 on 12/29/17.
//  Copyright © 2017 李耶罕. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var categoryTable: UITableView!
    //满屏都是图的问题categoryTable.rowHeight = 145 可以解决 XCODE 9的default tableview的问题
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.rowHeight = 145
        //self就是CategoriesVC这个class
        categoryTable.dataSource = self
        categoryTable.delegate = self//（在这个class）CategoriesVC就是这些protocol的代表
        //同上，因为我implement的 UITableViewDataSource, UITableViewDelegate 协议，我可以都设self
    }
    //numberOfRowsInSection 你想要table View 出现几行，how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
        //return the total number of items in this array --- DataService 应该直接自己运行了
    }
    
    //indexPath就是array index 更新tableViewCell的哪个item，
    //这就是你往cell里面填东西的地方，把原来的数据清理了，填新的数据，服务器一直在更新，这些cell需要被重新用
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell{ //as 意思是casted as
            //as? CategoryCell是只的我们把cell的type设成了CategoryCell
            //”CategoryCell“ 是storyboard里的 attribute inspector的 identifire，联系代码和屏幕上的TableViewCell prototype
            //dequeue 这个cell然后重新以CategoryCell的type召唤出来重新用，现在这个TableViewCell的type是CategoryCell。
            // 我们建立过了这个CategoryCell的class
            let categories = DataService.instance.getCategories()
            //从dataService拿个array，dataService应该直接自己运行了，不要建object
            let category = categories[indexPath.row] //grab the specific item out of the categories, 决定拿哪个出来
            cell.updateViews(category: category) //cell 是个我们上面建的，cell清空成功了，然后update
            //category是parameter的名字，没什么用在call 它这个func的时候，it‘s looking for a type => Category.这个格式没错
            //第二个category 就是我们建的Category的object，我们pass它进去，第一个省parameter的名字，起什么名字都行
            return cell //这个cell肚子里有货了，我们把它return了
        } else {
            return CategoryCell() //return一个空的cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row] //抓一个你屏幕点的category的row
        performSegue(withIdentifier: "ProductVC", sender: category) //那个segue的identifier就是ProductVC
        //sender 把那个这个category拿着，然后下面这个func用
    }
    
    //这个func在performSegue被叫后自动run
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductVC {
            //新建一个UIBarButtonItem，然后设成空String，必须这样做，要不Swift不接受。backBarButtonItem 其实是在上一个VC的
            //然后productVC的back button就只有个箭头了
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            //把productsVC当成segue.destination然后确定type／class是ProductVC
            assert(sender as? Category != nil)//确定sender的type不是nil，是Category （casted as Category,成功或失败,失败=nil）
            //assert保证如果不是Category的type直接在build time就crash，根本不会run
            productsVC.initProducts(category: sender as! Category) //sender 是我们上个func的，就是上个func的category
            //as 用来确定type（casted as），上个func的sender被pass了个category但是type是any，我们必须specify它的type为Category
            //force-unwraping因为我们知道它肯定是Category的type
            
        }
    }
    
}

