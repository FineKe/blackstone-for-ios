//
//  SpeciesDetailedHeaderCell.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/13.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

class SpeciesDetailedHeaderCell: UITableViewCell{

    var imgs:[String]!


    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var orderLatinLabel: UILabel!
    @IBOutlet weak var familyLatinLabel: UILabel!
    @IBOutlet weak var categoryLatinLabel: UILabel!
    @IBOutlet weak var englishNameLabel: UILabel!
    
    @IBOutlet weak var rootStackView: UIStackView!
    @IBOutlet weak var page: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



    




}
