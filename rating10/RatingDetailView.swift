//
//  RatingDetailView.swift
//  rating10
//
//  Created by Alexey Primechaev on 2/17/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI
import Introspect

struct RatingDetailView: View {
    
    @ObservedObject var rating = Rating()
    @EnvironmentObject var settings: UserSettings
    
    var action: () -> ()

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 7) {
                Spacer().frame(height:21)
                TextField("Enter Name", text: $rating.title)
                    .introspectTextField { textField in
                            textField.becomeFirstResponder()
                            textField.font = UIFont(name: "AppleColorEmoji", size: 34)
                            textField.font = .systemFont(ofSize: 34, weight: .bold)
                                      
                    }
                    .titleStyle()
                    .foregroundColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"FillCardTextColor"))
                    .padding(7)
                .accentColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"BackgroundColor"))
                ToggleButton(title: "Rating", values: Rating.ratings, value: $rating.rating)
                .environmentObject(self.settings)
                
                RegularButton(title: "Delete") {
                    self.action()
                }.environmentObject(self.settings)
                .foregroundColor(self.rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"FillCardTextColor"))
                    
                
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 21)
            .background(self.rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all) : Color(self.settings.selectedTheme+"FillModalCardColor").edgesIgnoringSafeArea(.all)
            )
           
        }
    }
}
