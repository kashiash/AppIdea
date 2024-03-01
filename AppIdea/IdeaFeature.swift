//
//  IdeaFeature.swift
//  AppIdea
//
//  Created by Jacek Kosinski U on 09/01/2024.
//

import Foundation
import SwiftData

@Model
class IdeaFeature {
    @Attribute(.unique)
  //  var name:String
    var detailedDescription: String
    var creationDate: Date
    var idea: AppIdea?
   // @Attribute(.externalStorage) var photo: Data?

    init(detailedDescription: String,  idea: AppIdea? = nil) {
        self.detailedDescription = detailedDescription
        self.creationDate = .now
        self.idea = idea
    }
}
