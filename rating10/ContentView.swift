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
    @FetchRequest(fetchRequest: Rating.getAllRatings()) var ratings:FetchedResults<Rating>
    
    var body: some View {
        List() {
            ForEach(ratings) { rating in
                RatingView(rating: rating)
            }
            Button(action: {
                let rating = Rating(context: self.managedObjectContext)
                rating.title = "Wow"
                rating.rating = Rating.ratings[0]
                rating.createdAt = Date()

                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            }) {
                Text("Add")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
