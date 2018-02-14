//
//  ViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/7.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SwiftProgressHUD


class SpeciesController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    let url = URL(string: "https://prod.api.blackstone.ebirdnote.cn/v1/species/categories")
    var data = Array<Array<Category>>()

    let refreshControl = UIRefreshControl()


    @IBOutlet weak var speciesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        speciesTableView.dataSource = self
        speciesTableView.delegate = self

        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        speciesTableView.refreshControl = refreshControl
        loadData()//加载数据
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func refreshData() {
        loadData()
        refreshControl.endRefreshing()//停止刷新loading显示
    }

    func loadData() {
        SwiftProgressHUD.showWait()
        data.removeAll()
        speciesTableView.reloadData()
        Alamofire.request(url!, method:.get, parameters: nil, encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                let json = JSON(value)
                print(json["code"])
                let data = json["data"]

                let 无脊椎动物 = data["无脊椎动物"]
                let 脊椎动物 = data["脊椎动物"]


                var arrayOne = Array<Category>()
                var arrayTwo = Array<Category>()

                for category in 脊椎动物.array!
                {
                    var ca = Category()
                    ca.name = category["name"].stringValue
                    ca.img = category["img"].stringValue
                    ca.speciesType = category["speciesType"].stringValue
                    arrayOne.append(ca)
                }

                for category in 无脊椎动物.array!
                {
                    var ca = Category()
                    ca.name = category["name"].stringValue
                    ca.img = category["img"].stringValue
                    ca.speciesType = category["speciesType"].stringValue
                    arrayTwo.append(ca)
                }

                self.data.append(arrayOne)
                self.data.append(arrayTwo)
                self.speciesTableView.reloadData()
                SwiftProgressHUD.hideAllHUD()
            case .failure(let error):
                print(error)
            }
        }
    }

    //设置章节数目
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0  {
            return "脊椎动物"
        }else if section == 1
        {
            return "无脊椎动物"
        }else
        {
            return "未知"
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.count == 0 {
            return 0
        }else
        {
            return data[section].count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: SpeciesTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SpeciesTableViewCell
        cell.speciesClassName.text = data[indexPath.section][indexPath.row].name
        cell.speciesIcon.kf.setImage(with: URL(string: data[indexPath.section][indexPath.row].img))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SpeciesClassViewController
        controller.category = data[speciesTableView.indexPathForSelectedRow!.section][speciesTableView.indexPathForSelectedRow!.row]
    }
}

