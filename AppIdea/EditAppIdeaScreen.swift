//
//  EditAppIdeaScreen.swift
//  AppIdea
//
//  Created by Jacek Kosinski U on 09/01/2024.
//

import SwiftUI
import SwiftData

struct EditAppIdeaScreen: View {

    @Bindable var appIdea: AppIdea

    @State private var newDescription = ""

    var body: some View {
        Form{
            TextField("Name",text: $appIdea.name)
            TextField("Description",text: $appIdea.detailedDescription, axis: .vertical)
            Section("Features") {

                TextField("Description",text: $newDescription)
                    .onSubmit {
                        let feature = IdeaFeature(detailedDescription: newDescription)
                        appIdea.features.append(feature)
                        newDescription.removeAll()
                    }

                ForEach($appIdea.features) { feature in
                    TextField("Feature",text: feature.detailedDescription)
                }
                .onDelete{ indexSet in
                    guard let index = indexSet.first else { return }
                    let feature = appIdea.features[index]
                    appIdea.features = appIdea.features.filter {$0.id != feature.id}
                }
            }
        }
    }
}

//#Preview {
//    EditAppIdeaScreen()
//}
