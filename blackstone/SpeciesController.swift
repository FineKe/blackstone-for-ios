//
//  ViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/7.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

class SpeciesController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    let url = URL(string: "https://prod.api.blackstone.ebirdnote.cn/v1/species/list")

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

        let globaQueue = DispatchQueue.global()

        globaQueue.async {
            let data:Data!
            do
            {
                try data = Data(contentsOf: self.url!)
                let json = String(data: data, encoding: String.Encoding.utf8)
                print(json)
                print(data.description)
            }catch
            {
                print("加载失败")
            }

        }


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: SpeciesTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SpeciesTableViewCell
        return cell
    }


   
}

