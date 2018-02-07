//
//  ViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/7.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

class SpeciesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        self.navigationItem.title = "物种"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255.0, green: 119/255.0, blue: 197/255.0, alpha: 100/255.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

