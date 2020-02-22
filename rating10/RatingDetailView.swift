//
//  RatingDetailView.swift
//  rating10
//
//  Created by Alexey Primechaev on 2/17/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct RatingDetailView: View {
    
    @ObservedObject var rating = Rating()
    @EnvironmentObject var settings: UserSettings

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height:21)
                TextField("", text: $rating.title)
                    .titleStyle()
                    .foregroundColor(rating.rating == Rating.ratings[0] ? Color(themes[self.settings.selectedTheme]+"OutlineCardColor") : Color(themes[self.settings.selectedTheme]+"FillCardColor"))
                    .padding(7)
                ToggleButton(title: "Rating", values: Rating.ratings, value: $rating.rating)
                .environmentObject(self.settings)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 21)
        }
    }
}

struct RatingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingDetailView()
    }
}
