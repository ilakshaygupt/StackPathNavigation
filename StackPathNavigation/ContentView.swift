//
//  StackPathNavigationApp.swift
//  StackPathNavigation
//
//  Created by Lakshay Gupta on 07/11/24.
//

import SwiftUI

struct Customer: Identifiable, Hashable {
    let name: String
    let id = UUID()
}


struct CustomerDetailView: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        Button("Home") {
            navigationState.routes.append(.home)
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
            VStack {
                Button("Home") {
                    navigationState.routes.append(.home)
                }
                
                Button("Detail") {
                    navigationState.routes.append(.detail(Customer(name: "John Doe")))
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(NavigationState())
                .navigationDestination(for: Route.self) { route in
                    switch route {
                        case .home:
                            Text("Home")
                        case .detail(let customer):
                            Text(customer.name)
                    }
                }
        }
    }
}
