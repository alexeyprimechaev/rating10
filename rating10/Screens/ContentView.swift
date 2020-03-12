//
//  ContentView.swift
//  rating10
//
//  Created by Alexey Primechaev on 2/17/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @EnvironmentObject var settings: UserSettings
  
    @FetchRequest(fetchRequest: Rating.getAllRatings()) var ratings:FetchedResults<Rating>
  
    
    var body: some View {
        VStack(spacing: 0) {
        TitleBar() 
        List() {
            ForEach(ratings) { rating in
                if (self.settings.isInLikedMode) {
                    if (rating.rating == Rating.ratings[0]) {
                        RatingView(rating: rating).listRowBackground(Color(self.settings.selectedTheme+"BackgroundColor"))
                    }
                } else {
                    RatingView(rating: rating).listRowBackground(Color(self.settings.selectedTheme+"BackgroundColor"))
                }
                
                
            }.background(Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all))
            }.background(Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all))
        BottomBar()
        }.background(Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all))
            
        .onAppear() {
            if (UserDefaults.standard.bool(forKey: "defaultBundle") == false) {
                 UserDefaults.standard.set(true, forKey: "defaultBundle")
            }
            
           
        }
    }
}

