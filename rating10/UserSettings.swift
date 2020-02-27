//
//  UserSettings.swift
//  rating10
//
//  Created by hex dyachuk on 21.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation

let themes = ["default", "capitanUSA", "lgbtqplus", "angryClown"]

//let themes2 = [Theme(name: "default", bundle: "default")]

class UserSettings: ObservableObject {
    var unlockedThemes = [0]
    @Published var selectedTheme = 0
}

