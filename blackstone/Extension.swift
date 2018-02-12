//
//  Extension.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/12.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    func widthAndHeight(font : UIFont , maxSize : CGSize) -> CGSize {
        return self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font : font], context: nil).size
    }
}

extension UILabel
{
    //自动设置宽高
    func setAutoSize(maxSize:CGSize) {
        let size = self.text?.widthAndHeight(font: self.font, maxSize: maxSize)
        self.frame.size = size!
    }
}
