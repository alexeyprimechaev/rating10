//
//  Theme.swift
//  rating10
//
//  Created by hex dyachuk on 27.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation




let bundles = [
    Bundle(themes: [Theme(codeName: "default", displayName: "Monochrome")
        ], productID: "defaultBundle", displayName: "Default Themes"
    ),
    Bundle(themes: [Theme(codeName: "capitanUSA", displayName: "Capitan USA"),
                    Theme(codeName: "insectMan", displayName: "Insect Man"),
                    Theme(codeName: "spaceInsectMan", displayName: "Space Insect Man"),
                    Theme(codeName: "muscleMan", displayName: "Muscle Man"),
                    Theme(codeName: "spaceFox", displayName: "Space Fox")
        ], productID: "com.monochromedev.rating10.WonderPersonsThemeBundle", displayName: "Wonder Persons"
    ),
    Bundle(themes: [Theme(codeName: "majorWonder", displayName: "Major Wonder"),
                    Theme(codeName: "muscleWoman", displayName: "Muscle Woman"),
                    Theme(codeName: "insectWoman", displayName: "Insect Woman"),
                    Theme(codeName: "kbgAgent", displayName: "KBG Agentess")
        ], productID: "com.monochromedev.rating10.SuperiorWomenThemeBundle", displayName: "Superior Women"
    ),
    
    Bundle(themes: [Theme(codeName: "LGBTQPls", displayName: "LGBTQ+"),
                    Theme(codeName: "transgender", displayName: "Transgenderism"),
                    Theme(codeName: "pansexual", displayName: "Pansexualism"),
                    Theme(codeName: "bisexual", displayName: "Bisexualism"),
                    Theme(codeName: "polyamory", displayName: "Polyamory"),
                    Theme(codeName: "marxism", displayName: "Marxism")
        ], productID: "com.monochromedev.rating10.ProgressThemeBundle", displayName: "Progress"
    ),
    
    Bundle(themes: [Theme(codeName: "oscarClown", displayName: "Oscar Clown"),
                    Theme(codeName: "deadClown", displayName: "Dead Clown"),
                    Theme(codeName: "jarClown", displayName: "Jar Clown"),
                    Theme(codeName: "comicClown", displayName: "Comic Clown"),
        ], productID: "com.monochromedev.rating10.ClownsThemeBundle", displayName: "Clowns"
    ),
    
    Bundle(themes: [Theme(codeName: "swoloMouseMan", displayName: "Swolo Mouse Man"),
                    Theme(codeName: "realisticMouseMan", displayName: "Realistic Mouse Man"),
                    Theme(codeName: "TVMouseMan", displayName: "TV Mouse Man"),
                    Theme(codeName: "TVMouseManFriend", displayName: "TV Mouse Man Friend"),
        ], productID: "com.monochromedev.rating10.MouseManThemeBundle", displayName: "Mouse Men"
    ),
    
    Bundle(themes: [Theme(codeName: "brickType1", displayName: "Brick Type 1"),
                    Theme(codeName: "brickType2", displayName: "Brick Type 2"),
                    Theme(codeName: "brickType3", displayName: "Brick Type 3"),
                    Theme(codeName: "brickType4", displayName: "Brick Type 4"),
                    Theme(codeName: "wetBrick", displayName: "Wet Brick"),
                    Theme(codeName: "shabolovskayaBrick", displayName: "Shabolovskaya Brick"),
        ], productID: "com.monochromedev.rating10.BricksThemeBundle", displayName: "Bricks"
    ),
    
    Bundle(themes: [Theme(codeName: "strawberryYoghurt", displayName: "Strawberry Yogurt"),
                    Theme(codeName: "cherryYoghurt", displayName: "Cherry Yogurt"),
                    Theme(codeName: "blueberryYoghurt", displayName: "Blueberry Yogurt"),
                    Theme(codeName: "naturalYoghurt", displayName: "Natural Yogurt"),
                    Theme(codeName: "raspberryYoghurt", displayName: "Raspberry Yogurt")
        ], productID: "com.monochromedev.rating10.YoghurtsThemeBundle", displayName: "Yogurts"
    ),
    
    Bundle(themes: [Theme(codeName: "clearWater", displayName: "Clear Water"),
                    Theme(codeName: "unclearWater1", displayName: "Dirty Water"),
                    Theme(codeName: "unclearWater2", displayName: "Boiled Water"),
        ], productID: "com.monochromedev.rating10.WatersThemeBundle", displayName: "Waters"
    ),
    
    Bundle(themes: [Theme(codeName: "darkSoda", displayName: "Dark Soda"),
                    Theme(codeName: "greenSoda", displayName: "Green Soda"),
                    Theme(codeName: "orangeSoda", displayName: "Orange Soda")
        ], productID: "com.monochromedev.rating10.SodasThemeBundle", displayName: "Sodas"
    )
    
]


struct Bundle: Hashable{
    static func == (lhs: Bundle, rhs: Bundle) -> Bool {
        lhs.productID == rhs.productID
    }
    
    let themes: [Theme]
    let productID: String
    let displayName: String
}

struct Theme: Hashable {
    static func == (lhs: Theme, rhs: Theme) -> Bool {
        return lhs.codeName == rhs.codeName
    }
    
    let codeName:String
    let displayName: String
    
}
