//
//  Purchase.swift
//  Solutions
//
//  Created by al on 6/6/25.
//

import Foundation

import Wand

struct Purchase {
    
    struct Order {
        
        struct Configuration {
             
            let url: URL
            
        }
        
        func confirm() {
        }
        
    }
    
}

protocol Orderable {
    
    func configuration(options: [String: Any]) -> Purchase.Order.Configuration
    
}

extension Orderable {
    
    func configuration(options: [String: Any] = [:]) -> Purchase.Order.Configuration {
        .init(url: URL(string: "https://porsche.de/orders/\((1...Int.max).randomElement()!))")!)
    }
    
}

@discardableResult
@inline(__always)
func | (configuration: Purchase.Order.Configuration, order: @escaping (Purchase.Order)->() ) -> Wand {
    
    Task {
        
        try! await Task.sleep(for: .seconds(1))
        order(Purchase.Order())
        
    }
    
    return Wand()
    
}
