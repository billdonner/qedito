//
//  qeditoApp.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData



@main
struct qeditoApp: App {
  @Environment(\.colorScheme) var colorScheme
  var sharedModelContainer: ModelContainer = {
      let schema = Schema([
        QTopic.self,Question.self
      ])
      let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

      do {
          return try ModelContainer(for: schema, configurations: [modelConfiguration])
      } catch {
          fatalError("Could not create ModelContainer: \(error)")
      }
  }()

  var body: some Scene {
      WindowGroup {
          ContentView() 
          .environment(\.colorScheme, .dark) // Force light mode
      }
      .modelContainer(sharedModelContainer)
  }
}
