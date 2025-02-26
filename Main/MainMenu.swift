//
//  ContentView.swift
//  Project1
//
//  Created by Adam El-Telbani on 2/19/25.
//


import SwiftUI

struct MainMenu: View {
    
    
    var body: some View {
        NavigationView {
            Form {
                
                NavigationLink(destination: Flags()) {
                    Text("Guess the Flag")}
                
                NavigationLink(destination: Tips()) {
                    Text("Tip Calculator")}
                
                .navigationTitle("All My Apps")
            }
        }
    }
}
struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
