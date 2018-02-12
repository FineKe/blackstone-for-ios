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

class SpeciesDetailViewController: UIViewController {

    var biology:Biology!
    let url = "https://prod.api.blackstone.ebirdnote.cn/v1/species/"


    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var orderLatin: UILabel!
    @IBOutlet weak var familyLatin: UILabel!
    @IBOutlet weak var catehoryLatin: UILabel!




    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = biology.chineseName
        orderLabel.text = biology.order+">"
        orderLabel.setAutoSize(maxSize: CGSize(width: 300, height: 20))

        familyLabel.text = biology.family
        familyLabel.setAutoSize(maxSize: CGSize(width: 300, height: 20))

        orderLatin.text = biology.orderLatin+">"
        orderLatin.setAutoSize(maxSize: CGSize(width: 300, height: 20))

        familyLatin.text = biology.familyLatin
        familyLatin.setAutoSize(maxSize: CGSize(width: 300, height: 20))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
