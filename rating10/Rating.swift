//
//  Rating.swift
//  rating10
//
//  Created by Alexey Primechaev on 2/17/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation
import CoreData

public class Rating: NSManagedObject, Identifiable {
    @NSManaged public var createdAtStored: Date?
    @NSManaged public var titleStored: String?
    @NSManaged public var ratingStored: String?
    
    static let ratings = ["Good", "Bad"]
}

extension Rating {
    
    var createdAt: Date {
        get { createdAtStored ?? Date() }
        set { createdAtStored = newValue }
    }
    
    var rating: String {
        get { ratingStored ?? "Unrated" }
        set { ratingStored = newValue }
    }
    
    var title: String {
        get { titleStored ?? "Found Nil" }
        set { titleStored = newValue }
    }
}

extension Rating {
    static func getAllRatings() -> NSFetchRequest<Rating> {
        let request: NSFetchRequest<Rating> = Rating.fetchRequest() as! NSFetchRequest<Rating>
        request.sortDescriptors = [
            NSSortDescriptor(key: "createdAtStored", ascending: false)
        ]
        
        return request
    }
}

