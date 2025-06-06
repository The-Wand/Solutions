//
//  ContentView.swift
//  Solutions
//
//  Created by al on 6/6/25.
//

import SwiftUI

import Wand

struct ContentView: View {
    
    var body: some View {
        VStack {
            
            Button("Try") {
                makeAnOrder()
            }
            
        }
        .padding()
    }
    
    func makeAnOrder() {
        
        Porsche.Model718.GT4.configuration() | { (order: Purchase.Order) in
            order.confirm()
        }
        
    }
    
}

#Preview {
    ContentView()
}
