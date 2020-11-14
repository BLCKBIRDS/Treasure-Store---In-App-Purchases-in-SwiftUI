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
            List(storeManager.myProducts, id: \.self) { product in
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.localizedTitle)
                            .font(.headline)
                        Text(product.localizedDescription)
                            .font(.caption2)
                    }
                    Spacer()
                    if UserDefaults.standard.bool(forKey: product.productIdentifier) {
                        Text("Purchased")
                            .foregroundColor(.green)
                    } else {
                        Button(action: {
                            storeManager.purchaseProduct(product: product)
                        }) {
                            Text("Buy for \(product.price) $")
                        }
                            .foregroundColor(.blue)
                    }
                }
            }
                .navigationTitle("Treasure Store 🏴‍☠️")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            storeManager.restoreProducts()
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
