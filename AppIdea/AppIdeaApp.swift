//
//  AppIdeaApp.swift
//  AppIdea
//
//  Created by Jacek Kosinski U on 09/01/2024.
//

import SwiftUI
import SwiftData

@main
struct AppIdeaApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: AppIdea.self)
    }
}
