//
//  RatingView.swift
//  rating10
//
//  Created by Alexey Primechaev on 2/17/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var settings: UserSettings
    
    @ObservedObject var rating = Rating()
    
    
    @State var newRatingName = ""
    @State var showDetail = false
    @State var toggleIsOn = false
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
        }) {
            ZStack() {
                    // Обводка
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64, maxHeight: 64, alignment: .leading)
                        .foregroundColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardColor") : Color(self.settings.selectedTheme+"FillCardColor"))

                    // Заливка
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .padding(2)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 64, alignment: .leading)
                        .foregroundColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"BackgroundColor") : Color(self.settings.selectedTheme+"FillCardColor"))

                    // Текст и Тоггл
                    HStack(spacing: 0) {
                        Text(rating.title)
                            .padding(.leading, 18)
                            .font(.system(size: 17, weight: .semibold, design: .default))
                        .foregroundColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"FillCardTextColor"))
                        Spacer()
                    }
            }
        }
        .sheet(isPresented: $showDetail) {
            RatingDetailView(rating: self.rating).background(self.rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"BackgroundColor") : Color(self.settings.selectedTheme+"FillModalCardColor"))
            .environmentObject(self.settings)
        }
                    
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
