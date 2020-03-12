//
//  BottomBar.swift
//  rating10
//
//  Created by hex dyachuk on 22.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//
//helo

import SwiftUI

struct BottomBar: View {
    @EnvironmentObject var settings: UserSettings
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Rating.getAllRatings()) var ratings:FetchedResults<Rating>
    
    @State var isPresening = false
    
    var body: some View {
        HStack {
            Button(action: {
                let rating = Rating(context: self.managedObjectContext)
                rating.title = ""
                rating.rating = Rating.ratings[0]
                rating.createdAt = Date()

                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                self.isPresening = true
            }) {
                HStack {
                Image(systemName: "plus")
                    .foregroundColor(Color(self.settings.selectedTheme+"AddButtonColor"))
                Text("Add Rating")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(self.settings.selectedTheme+"AddButtonColor"))
                }
            }.padding(16)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .center).background(Color(self.settings.selectedTheme+"BackgroundColor"))
            .sheet(isPresented: $isPresening, onDismiss: {
                if self.ratings[0].title == "" {
                    self.managedObjectContext.delete( self.ratings[0])
                }
            }) {
                RatingDetailView(rating: self.ratings[0], action: {
                    self.managedObjectContext.delete(self.ratings[0])
                    self.isPresening.toggle()
                }, dismiss: {self.isPresening = false}).background(self.ratings[0].rating == Rating.ratings[0] ? Color(self.settings.selectedTheme+"BackgroundColor").edgesIgnoringSafeArea(.all) : Color(self.settings.selectedTheme+"FillModalCardColor").edgesIgnoringSafeArea(.all))
                .environmentObject(self.settings)
        }
    
        
            
    }
   
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}

