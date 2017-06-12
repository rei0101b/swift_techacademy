//
//  Task.swift
//  tech_TaskApp
//
//  Created by Rei Yamaguchi on 2017/06/13.
//  Copyright © 2017年 rei.yamaguchi. All rights reserved

import Foundation
import RealmSwift

class Task: Object {

    dynamic var id = 0
    dynamic var title = ""
    dynamic var contents = ""
    dynamic var date = Date()
    // IDをプライマリーキーとして設定
    override static func primaryKey() -> String {
        return "id"
    }

}
