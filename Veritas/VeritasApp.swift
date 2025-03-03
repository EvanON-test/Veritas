//
//  VeritasApp.swift
//  Veritas
//
//  Created by Evan Neale on 03/03/2025.
//

import SwiftUI

@main
struct VeritasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
