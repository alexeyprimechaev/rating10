//
//  Theme.swift
//  rating10
//
//  Created by hex dyachuk on 27.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation

let idsdontdelete = ["com.monochromedev.rating10.WonderPersonsThemeBundle", "com.monochromedev.rating10.DarkPersonsThemeBundle"]

struct Bundle {
    let themes: [Theme]
    let productID: String
    let displayName: String
    let isPurchased: Bool
}

struct Theme {
    let codeName:String
    let displayName: String
}
