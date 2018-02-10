//
//  SettingViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/7.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view.backgroundColor = UIColor.white
//        self.navigationItem.title = "设置"
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255.0, green: 119/255.0, blue: 197/255.0, alpha: 100/255.0)
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
//        let loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 20, width: 80, height: 80))
//        loading.type = .ballGridBeat
//        loading.startAnimating()
//        self.view.addSubview(loading)
        let loadingView: LoadingView = LoadingView(frame: CGRect(x: self.view.frame.size.width/2-50, y: self.view.frame.size.height/2-50, width: 100, height: 100))

        loadingView.backgroundColor = UIColor(displayP3Red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 0.3)

        self.view.addSubview(loadingView)

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
