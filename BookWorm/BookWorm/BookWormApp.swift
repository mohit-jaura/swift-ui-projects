//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Mohit Soni on 21/11/23.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Book.self)
    }
}
