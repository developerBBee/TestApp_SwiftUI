//
//  testAppApp.swift
//  testApp
//
//  Created by ak on 2023/06/10.
//

import SwiftUI

@main
struct testAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
