//
//  ContentView.swift
//  rating10
//
//  Created by Alexey Primechaev on 2/17/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI
import ASCollectionView

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
                        RatingView(rating: rating).listRowBackground(Color(self.settings.selectedTheme+"BackgroundColor")).listRowInsets(EdgeInsets(top: 7, leading: 14, bottom: 7, trailing: 14))
                    }
                } else {
                    RatingView(rating: rating).listRowBackground(Color(self.settings.selectedTheme+"BackgroundColor")).listRowInsets(EdgeInsets(top: 7, leading: 14, bottom: 7, trailing: 14))
                }
                
                
            }.background(Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all))
        }.background(Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all)).introspectTableView { tableView in
            tableView.backgroundColor = UIColor(named: self.settings.selectedTheme+"BackgroundColor")
            tableView.separatorStyle = .none
            tableView.separatorColor = .clear
            }
        BottomBar()
        }.background(Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all))
            
        .onAppear() {
            if (UserDefaults.standard.bool(forKey: "defaultBundle") == false) {
                 UserDefaults.standard.set(true, forKey: "defaultBundle")
            }
            
           
        }
    }
}

