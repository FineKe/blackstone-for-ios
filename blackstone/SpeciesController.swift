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

class SpeciesController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    let url = URL(string: "https://prod.api.blackstone.ebirdnote.cn/v1/species/categories")
    var data = Array<Array<Category>>()


    @IBOutlet weak var speciesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "物种"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255.0, green: 119/255.0, blue: 197/255.0, alpha: 100/255.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]

        speciesTableView.dataSource = self
        speciesTableView.delegate = self

//        let globaQueue = DispatchQueue.global()
//
//        globaQueue.async {
//            let data:Data!
//            do
//            {
//                try data = Data(contentsOf: self.url!)
//                let json = String(data: data, encoding: String.Encoding.utf8)
//                print(json)
//                print(data.description)
//            }catch
//            {
//                print("加载失败")
//            }
//
//        }
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
            case .failure(let error):
                    print(error)
            }
//            do
//            {
//                let json = try JSON(String(data: response.data!, encoding: String.Encoding.utf8))
//                print(json["code"].intValue)
//                print(json)
//            }catch
//            {
//                print("下载失败")
//            }
        }



    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        controller.name = data[speciesTableView.indexPathForSelectedRow!.section][speciesTableView.indexPathForSelectedRow!.row].name
    }
   
}

