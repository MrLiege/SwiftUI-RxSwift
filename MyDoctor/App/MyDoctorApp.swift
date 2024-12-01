//
//  MyDoctorApp.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import SwiftUI

@main
struct MyDoctorApp: App {
    let persistenceController = DataController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
