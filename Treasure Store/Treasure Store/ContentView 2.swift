//
//  ContentView.swift
//  Treasure Store
//
//  Created by Andreas Schultz on 08.11.20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var storeManager: StoreManager
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Power Sword")
                            .font(.headline)
                        Text("Dominate your enemies with this noble weapon")
                            .font(.caption2)
                    }
                    Spacer()
                    if UserDefaults.standard.bool(forKey: "*ID of IAP Product*") {
                        Text("Purchased")
                            .foregroundColor(.green)
                    } else {
                        Button(action: {
                            //Purchase particular IAO product
                        }) {
                            Text("Buy for 1.09 $")
                        }
                            .foregroundColor(.blue)
                    }
                }
            }
                .navigationTitle("Treasure Store 🏴‍☠️")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            //Restore products already purchased
                        }) {
                            Text("Restore Purchases ")
                        }
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storeManager: StoreManager())
    }
}
