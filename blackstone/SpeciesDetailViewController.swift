//
//  SpeciesDetailViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/12.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftProgressHUD

class SpeciesDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{


    var biology:Biology!
    let url = "https://prod.api.blackstone.ebirdnote.cn/v1/species/"
    var bird:Bird!
    var amphibia:Amphibia!
    var insect:Insect!
    var reptiles:Reptiles!






    @IBOutlet weak var speciesDetailedTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = biology.chineseName //设置标题
        speciesDetailedTableView.delegate = self
        speciesDetailedTableView.dataSource = self
        loadData()
    }


    override func viewDidAppear(_ animated: Bool) {
        
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData(){

        Alamofire.request(url+String(biology.id), method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result
            {

            case .success(let value):
                let json = JSON(value)
                if json["code"].intValue == 88
                {   let data = json["data"]
                    switch self.biology.speciesType {
                    case .Amphibia:
                        print("ll")
                        var imgs = [String]()

                        for img in data["imgs"].arrayValue
                        {
                            imgs.append(img["url"].stringValue)
                            print(img["url"].stringValue)

                        }

                        var feature = Dictionary<String,String>()

                        for (key,value) in data["features"]
                        {
                            feature[key] = value.stringValue
                        }
                        self.amphibia = Amphibia(id: self.biology.id, chineseName: self.biology.chineseName, latinName: self.biology.latinName, order: self.biology.order, orderLatin: self.biology.orderLatin, family: self.biology.family, familyLatin: self.biology.familyLatin, genus: data["genus"].stringValue, genusLatin: data["genusLatin"].stringValue, imgs: imgs, features: feature, speciesType:"amphibia")

                    case .Bird:
                        var imgs = [String]()

                        for img in data["imgs"].arrayValue
                        {
                            imgs.append(img["url"].stringValue)
                            print(img["url"].stringValue)

                        }

                        var feature = Dictionary<String,String>()

                        for (key,value) in data["features"]
                        {
                            feature[key] = value.stringValue
                        }

                        self.bird = Bird(id: self.biology.id, chineseName: self.biology.chineseName, englishName: self.biology.englishName, latinName: self.biology.latinName, order: self.biology.order, orderLatin: self.biology.orderLatin, family: self.biology.family, familyLatin: self.biology.familyLatin, genusLatin: data["genusLatin"].stringValue, imgs: imgs, features: feature, speciesType: "bird")

                    case .Insect:
                        var imgs = [String]()

                        for img in data["imgs"].arrayValue
                        {
                            imgs.append(img["url"].stringValue)
                            print(img["url"].stringValue)

                        }

                        var feature = Dictionary<String,String>()

                        for (key,value) in data["features"]
                        {
                            feature[key] = value.stringValue
                        }
                        self.insect = Insect(id: self.biology.id, chineseName: self.biology.chineseName, latinName: self.biology.latinName, order: self.biology.order, orderLatin: self.biology.orderLatin, imgs: imgs, features: feature, speciesType: "insect")

                    case .Reptiles:
                        var imgs = [String]()

                        for img in data["imgs"].arrayValue
                        {
                            imgs.append(img["url"].stringValue)
                            print(img["url"].stringValue)

                        }

                        var feature = Dictionary<String,String>()

                        for (key,value) in data["features"]
                        {
                            feature[key] = value.stringValue
                        }
                        self.reptiles = Reptiles(id: self.biology.id
                            , chineseName: self.biology.chineseName, latinName: self.biology.latinName, order: self.biology.order, orderLatin: self.biology.orderLatin, family: self.biology.family, familyLatin: self.biology.familyLatin, genus: data["genus"].stringValue, genusLatin: data["genusLatin"].stringValue, imgs: imgs, features: feature, speciesType: "reptiles")

                    default:
                        break;

                    }
                }else
                {

                }
                self.speciesDetailedTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }


    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch biology.speciesType {
        case .Amphibia:
            if amphibia == nil
            {
                return 0
            }else
            {
                return 14
            }
        case .Bird:
            if bird == nil
            {
                return 0
            }else
            {
                return 14
            }
        case .Insect:
            if insect == nil
            {
                return 0
            }else
            {
                return 15
            }
        case .Reptiles:
            if reptiles == nil
            {
                return 0
            }else
            {
                return 14
            }
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let identifier = String(describing: SpeciesDetailedHeaderCell.self)

            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SpeciesDetailedHeaderCell
            let pageView = HHScrollView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.page.frame.height))
            if biology.speciesType == .Bird {
                cell.orderLabel.text = bird.order + ">"
                cell.familyLabel.text = bird.family
                cell.categoryLabel.text = " "
                cell.orderLatinLabel.text = bird.orderLatin+">"
                cell.familyLatinLabel.text = bird.familyLatin+">"
                cell.categoryLatinLabel.text = bird.latinName
                cell.englishNameLabel.text = bird.englishName
                pageView.imgUrls = bird.imgs as NSArray
            }else if biology.speciesType == .Amphibia
            {
                cell.orderLabel.text = amphibia.order + ">"
                cell.familyLabel.text = amphibia.family+">"
                cell.categoryLabel.text = amphibia.genus
                cell.orderLatinLabel.text = amphibia.orderLatin+">"
                cell.familyLatinLabel.text = amphibia.familyLatin+">"
                cell.categoryLatinLabel.text = amphibia.genusLatin
                cell.englishNameLabel.text = ""
                pageView.imgUrls = amphibia.imgs as NSArray
            }else if biology.speciesType == .Insect
            {
                cell.orderLabel.text = insect.order
                cell.orderLatinLabel.text = insect.orderLatin
                cell.familyLabel.text = ""
                cell.familyLatinLabel.text = ""
                cell.categoryLabel.text = ""
                cell.categoryLatinLabel.text = ""
                cell.englishNameLabel.text = ""
                pageView.imgUrls = insect.imgs as NSArray
            }else
            {
                cell.orderLabel.text = reptiles.order + ">"
                cell.familyLabel.text = reptiles.family + ">"
                cell.categoryLabel.text = reptiles.genus
                cell.orderLatinLabel.text = reptiles.orderLatin+">"
                cell.familyLatinLabel.text = reptiles.familyLatin+">"
                cell.categoryLatinLabel.text = reptiles.latinName
                cell.englishNameLabel.text = ""
                pageView.imgUrls = reptiles.imgs as NSArray
            }


            cell.orderLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.orderLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.familyLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.categoryLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.orderLatinLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.familyLatinLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.categoryLatinLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            cell.englishNameLabel.setAutoSize(maxSize: CGSize(width: 400, height: 20))
            pageView.autoScrollDelay = 4
            pageView.currentPageControlColor = UIColor.blue
            pageView.pageControlColor = UIColor.lightGray
            cell.page.addSubview(pageView)
            return cell

        }else
        {
            let identifier = "speciesDetailedBodyCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SpeciesDetailedBodyCell

            switch biology.speciesType
            {
            case .Amphibia:
                var i = 0
                for (key,value) in amphibia.features
                {
                    if i == indexPath.row - 1
                    {
                        cell.itemNameLabel.text = key
                        cell.contentLabel.text = value

                    }
                     i += 1
                }
            case .Bird:
                var i = 0
                for (key,value) in bird.features
                {
                    if i == indexPath.row - 1
                    {
                        cell.itemNameLabel.text = key
                        cell.contentLabel.text = value

                    }
                     i += 1
                }
            case .Insect:
                var i = 0
                for (key,value) in insect.features
                {
                    if i == indexPath.row - 1
                    {
                        cell.itemNameLabel.text = key
                        cell.contentLabel.text = value

                    }
                     i += 1
                }
            case .Reptiles:
                var i = 0
                for (key,value) in reptiles.features
                {
                    if i == indexPath.row - 1
                    {
                        cell.itemNameLabel.text = key
                        cell.contentLabel.text = value

                    }
                     i += 1
                }

            }
            return cell
        }

    }


    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
