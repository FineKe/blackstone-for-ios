//
//  SpeciesTableViewCell.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/8.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

class SpeciesTableViewCell: UITableViewCell {

    @IBOutlet weak var speciesClassName: UILabel!

    @IBOutlet weak var speciesIcon: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
