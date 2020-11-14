//
//  Treasure_StoreApp.swift
//  Treasure Store
//
//  Created by Andreas Schultz on 08.11.20.
//

import SwiftUI
import StoreKit

@main
struct Treasure_StoreApp: App {
    
    let productIDs = [
        //Use your product IDs instead
        "com.BLCKBIRDS.TreasureStore.IAP.PowerSword",
        "com.BLCKBIRDS.TreasureStore.IAP.HealingPotion",
        "com.BLCKBIRDS.TreasureStore.IAP.PirateSkin"
    ]
    
    @StateObject var storeManager = StoreManager ()
    
    var body: some Scene {
        WindowGroup {
            ContentView(storeManager: storeManager)
                .onAppear(perform: {
                    SKPaymentQueue.default().add(storeManager)
                    storeManager.getProducts(productIDs: productIDs)
                })
        }
    }
}
