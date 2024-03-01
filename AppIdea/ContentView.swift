//
//  ContentView.swift
//  AppIdea
//
//  Created by Jacek Kosinski U on 09/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var ideas: [AppIdea]

    @State private var showAddSheet = false

    @State private var newName: String = ""
    @State private var newDescription:String = ""


    var body: some View {
        NavigationStack {
            List {
                ForEach(ideas) { idea in
                    NavigationLink(value:idea) {
                        VStack{
                            Text(idea.name)
                            Text(idea.detailedDescription)
                                .textScale(.secondary)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete{ indexSet in
                    guard let index = indexSet.first else { return }

                    modelContext.delete(ideas[index])
                }
            }
            .navigationTitle("My ideas")
            .navigationDestination(for: AppIdea.self, destination: { idea in
                EditAppIdeaScreen(appIdea:idea)
            })
            .toolbar{
                Button("Add",systemImage: "plus") {
                    showAddSheet.toggle()
                }
            }
            .sheet(isPresented: $showAddSheet, content: {
                NavigationStack{
                    Form{
                        TextField("Name", text: $newName)
                        TextField("Description", text: $newDescription)
                    }
                    .navigationTitle("New Idea")
                    .toolbar{
                        Button("Dissmiss") {
                            showAddSheet.toggle()
                        }
                        Button("Save", systemImage: "disksquare.and.pencil"){
                            let idea = AppIdea(name: newName, detailedDescription: newDescription)
                            modelContext.insert(idea)
                            showAddSheet.toggle()
                            newName = ""
                            newDescription = ""
                        }
                        .disabled(newName.isEmpty && newDescription.isEmpty)

                    }
                }
                .presentationDetents([.medium])
            })

        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: AppIdea.self, inMemory: true)
}
