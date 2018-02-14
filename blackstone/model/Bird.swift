//
//  Bird.swift
//  blackstone
//
//  Created by fine fine.com on 2018/2/10.
//  Copyright © 2018年 fine.com. All rights reserved.
//

import Foundation
/*
 *鸟类
 */

struct Bird {
    var id:Int //id
    var chineseName:String //中文名
    var englishName:String //英文名（只有鸟类才有）
    var latinName:String //拉丁名
    var order:String //目 (昆虫没有此项)
    var orderLatin:String //目拉丁（昆虫没有此项）
    var family:String //科
    var familyLatin:String //科拉丁
    var genusLatin:String
    var imgs:[String]//
    var features:[String:String]//特征字典
    var speciesType:String //类型
}
