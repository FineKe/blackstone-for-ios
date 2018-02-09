//
//  SpeciesClassViewController.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/9.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

class SpeciesClassViewController: UIViewController {
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
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

    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}
