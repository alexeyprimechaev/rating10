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
    
    var dismiss: () -> ()

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 7) {
                Spacer().frame(height:21)
                TextField("Enter Name", text: $rating.title) {
                    if self.rating.title == "" {
                        self.action()
                    }
                    self.dismiss()
                }
                    .introspectTextField { textField in
                        textField.becomeFirstResponder()
                        let str = NSAttributedString(string: "Enter Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: self.rating.rating == Rating.ratings[0] ? self.settings.selectedTheme+"OutlineCardTextColor" : self.settings.selectedTheme+"FillCardTextColor")?.withAlphaComponent(0.5)])
                        textField.attributedPlaceholder = str
                        textField.font = UIFont(name: "AppleColorEmoji", size: 34)
                        textField.font = .systemFont(ofSize: 34, weight: .bold)
                    }
                    .titleStyle()
                    .foregroundColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"FillCardTextColor"))
                    .padding(7)
                .accentColor(rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"BackgroundColor"))
                ToggleButton(title: "Rating", values: Rating.ratings, value: $rating.rating)
                .environmentObject(self.settings)
                
                RegularButton(title: "Tweet") {
                    let tweetText = "I think " + self.rating.title + " is " + self.rating.rating + ". \n\nDownload Rating 10:"
                    let appURL = "number16.github.io/r10.html"

                    let shareString = "https://twitter.com/intent/tweet?text=\(tweetText)&url=\(appURL)"

                    // encode a space to %20 for example
                    let escapedShareString = shareString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

                    // cast to an url
                    let url = URL(string: escapedShareString)

                    // open in safari
                    UIApplication.shared.openURL(url!)
                }
                .foregroundColor(self.rating.rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"OutlineCardTextColor") : Color(self.settings.selectedTheme+"FillCardTextColor"))
                    
                
                
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
