//
//  Treasure_StoreApp.swift
//  Treasure Store
//
//  Created by Andreas Schultz on 08.11.20.
//

import SwiftUI

@main
struct Treasure_StoreApp: App {
    
    @StateObject var storeManager = StoreManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(storeManager: storeManager)
        }
    }
}
