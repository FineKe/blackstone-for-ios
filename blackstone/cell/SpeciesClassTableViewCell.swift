//
//  SpeciesClassTableViewCell.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/10.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

class SpeciesClassTableViewCell: UITableViewCell {

    @IBOutlet weak var chineseNameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!
    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var mainPhotoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
