//
//  BottomBar.swift
//  rating10
//
//  Created by hex dyachuk on 22.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct BottomBar: View {
    @EnvironmentObject var settings: UserSettings
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Rating.getAllRatings()) var ratings:FetchedResults<Rating>
    
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
                
            }) {
                HStack {
                Image(systemName: "plus")
                    .foregroundColor(Color(themes[self.settings.selectedTheme]+"AddButtonColor"))
                Text("Add Rating")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(themes[self.settings.selectedTheme]+"AddButtonColor"))
                }
            }.padding(16)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .center).background(Color(themes[self.settings.selectedTheme]+"BackgroundColor"))
    
        
            
    }
   
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}

