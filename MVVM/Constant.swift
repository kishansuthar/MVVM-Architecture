//
//  Constant.swift
//  MVVM
//
//  Created by Kishan Suthar on 07/06/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import Foundation
import UIKit

let appName = "MVVM"
let baseUrl = "http://15.185.104.250/project/api/"
let imgUrl = "https://image.tmdb.org/t/p/original"

class Constant: NSObject {

    struct Api {

        static let get_mapData = "get_new_mapData"
        
    }
    
    struct segueId {
        
        static let segueLoginToForgotPassword = "segueLoginToForgotPassword"
    }
    
    struct customCell {
     static let MoviewListCell = "MoviewListCell"
    }
    
    struct Color {
        static let themeColor = #colorLiteral(red: 0.8509803922, green: 0.007843137255, blue: 0.3568627451, alpha: 1)

    }
}

