//
//  AppIdea.swift
//  AppIdea
//
//  Created by Jacek Kosinski U on 09/01/2024.
//

import Foundation
import SwiftData

@Model
class AppIdea {

    
    @Attribute(.unique)
    var name:String
    var detailedDescription: String
    var creationDate: Date

    init(name: String, detailedDescription: String) {
        self.name = name
        self.detailedDescription = detailedDescription
        self.creationDate = .now
    }

    @Relationship(deleteRule: .cascade, inverse:\IdeaFeature.idea)
    var features: [IdeaFeature] = []
}
