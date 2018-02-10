//
//  SpeciesClassViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/9.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SwiftProgressHUD

class SpeciesClassViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    var category:Category!
    var url = URL(string: "https://prod.api.blackstone.ebirdnote.cn/v1/species/list")

    var data = Array<Biology>()
    var refresh:UIRefreshControl!
    @IBOutlet weak var speciesClassTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置标题
        self.title = category.name

        //设置筛选，排列按钮，并设置事件
        let filterButton = UIButton(type: .custom)
        filterButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        filterButton.setImage(#imageLiteral(resourceName: "btn_filter"), for: .normal)

        let filterUIBarButton = UIBarButtonItem(customView: filterButton)
        filterButton.addTarget(self, action: #selector(filter), for: .touchUpInside)

        let orderButton = UIButton(type: .custom)
        orderButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        orderButton.setImage(#imageLiteral(resourceName: "species_change_order"), for: .normal)

        let orderUIBarButton = UIBarButtonItem(customView: orderButton)
        orderButton.addTarget(self, action: #selector(changeOrder), for: .touchUpInside)

        //添加到 导航栏右边
        self.navigationItem.rightBarButtonItems = [filterUIBarButton,orderUIBarButton]

        self.speciesClassTableView.dataSource = self
        self.speciesClassTableView.delegate = self
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshData), for: UIControlEvents.valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "下拉立即刷新")
        speciesClassTableView.refreshControl = refresh
        loadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @objc
    func refreshData() {
        loadData()
        refresh.endRefreshing()
    }

    func loadData()
    {
        SwiftProgressHUD.showWait()
        data.removeAll()
        speciesClassTableView.reloadData()
        Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value)
                    if json["code"].intValue == 88
                    {   let data = json["data"]
                        switch self.category.speciesType
                        {
                        case "amphibia":
                            let amphibia = data["amphibia"].arrayValue

                            for am in amphibia
                            {
                                var biology = Biology(id:am["id"].intValue,
                                        chineseName: am["chineseName"].stringValue,
                                        englishName: "", latinName: am["latinName"].stringValue,
                                        order: am["order"].stringValue,
                                        orderLatin: am["orderLatin"].stringValue,
                                        family: am["family"].stringValue,
                                        familyLatin: am["familyLatin"].stringValue,
                                        mainPhoto: am["mainPhoto"].stringValue,
                                        speciesType: am["speciesType"].stringValue)
                                print(am["chineseName"].stringValue)
                                self.data.append(biology)
                            }
                        case "reptiles":
                            let reptiles = data["reptiles"].arrayValue
                            for re in reptiles
                            {
                                var biology = Biology(id:re["id"].intValue,
                                                      chineseName: re["chineseName"].stringValue,
                                                      englishName: "",
                                                      latinName: re["latinName"].stringValue,
                                                      order: re["order"].stringValue,
                                                      orderLatin: re["orderLatin"].stringValue,
                                                      family: re["family"].stringValue,
                                                      familyLatin: re["familyLatin"].stringValue,
                                                      mainPhoto: re["mainPhoto"].stringValue,
                                                      speciesType: re["speciesType"].stringValue)

                                self.data.append(biology)
                            }
                        case "bird":
                            let bird = data["bird"].arrayValue
                            for bi in bird
                            {
                                var biology = Biology(id:bi["id"].intValue,
                                                      chineseName: bi["chineseName"].stringValue,
                                                      englishName: bi["englishName"].stringValue,
                                                      latinName: bi["latinName"].stringValue,
                                                      order: bi["order"].stringValue,
                                                      orderLatin: bi["orderLatin"].stringValue,
                                                      family: bi["family"].stringValue,
                                                      familyLatin: bi["familyLatin"].stringValue,
                                                      mainPhoto: bi["mainPhoto"].stringValue,
                                                      speciesType: bi["speciesType"].stringValue)

                                self.data.append(biology)
                            }

                        case "insect":
                            let insect = data["insect"].arrayValue
                            for ins in insect
                            {
                                var biology = Biology(id:ins["id"].intValue,
                                                      chineseName: ins["chineseName"].stringValue,
                                                      englishName: "",
                                                      latinName: ins["latinName"].stringValue,
                                                      order: ins["order"].stringValue,
                                                      orderLatin: ins["orderLatin"].stringValue,
                                                      family: ins["family"].stringValue,
                                                      familyLatin: ins["familyLatin"].stringValue,
                                                      mainPhoto: ins["mainPhoto"].stringValue,
                                                      speciesType: ins["speciesType"].stringValue)
                                self.data.append(biology)
                            }
                        case .none:
                            print("none")
                        case .some(_):
                            print("some")
                        }
                    }else
                    {
                        print(json["message"].stringValue)
                    }
                case .failure(let error):
                    print(error)
                }
                self.speciesClassTableView.reloadData()
                SwiftProgressHUD.hideAllHUD()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifiter = String(describing: SpeciesClassTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiter) as! SpeciesClassTableViewCell
        let biology = data[indexPath.row]

        cell.mainPhotoImageView.kf.setImage(with: URL(string:biology.mainPhoto+"?imageView2/0/w/400/h/400"))
        cell.englishNameLabel.text = biology.englishName
        cell.chineseNameLabel.text = biology.chineseName
        cell.latinNameLabel.text = biology.latinName
        return cell
    }

    




    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
    }

    @objc
    func filter(){
        print("filter")
    }

    @objc func changeOrder(){
        print("changeOrder")
        let alertView = UIAlertController(title: "请选择一种查阅类型", message: "nil", preferredStyle: .actionSheet)


        let actionOne = UIAlertAction(title: "按目浏览", style: .default) { (_) in
            print("按目浏览")
        }

        let actionTwo = UIAlertAction(title: "按科浏览", style: .default) { (_) in
            print("按科浏览")
        }

        alertView.addAction(actionOne)
        alertView.addAction(actionTwo)

        present(alertView, animated: true, completion: nil)

    }
}

struct Biology {
    var id:Int //id
    var chineseName:String //中文名
    var englishName:String //英文名（只有鸟类才有）
    var latinName:String //拉丁名
    var order:String //目 (昆虫没有此项)
    var orderLatin:String //目拉丁（昆虫没有此项）
    var family:String //科
    var familyLatin:String //科拉丁
    var mainPhoto:String //主头像
    var speciesType:String //种类

    init(id:Int,chineseName:String,englishName:String = "",latinName:String,order:String = "",orderLatin:String = "",
         family:String,familyLatin:String,mainPhoto:String,speciesType:String) {
        self.id = id
        self.chineseName = chineseName
        self.englishName = englishName
        self.latinName = latinName
        self.order = order
        self.orderLatin = orderLatin
        self.family = family
        self.familyLatin = familyLatin
        self.mainPhoto = mainPhoto
        self.speciesType = speciesType
    }
}
