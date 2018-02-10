//
//  UIHelper.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/8.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import UIKit

extension UIView
{
//    @IBInspectable
//    var useOriginPixel: Bool {
//        get {
//            if self.renderingMode == .alwaysOriginal
//            {
//                return true
//            }else
//            {
//                return false
//            }
//        }
//        set {
//            if newValue
//            {
//                self.renderingMode == .alwaysOriginal
//            }else
//            {
//                self.renderingMode == .automatic
//            }
//        }
//    }

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

