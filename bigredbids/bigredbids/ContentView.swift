//
//  ContentView.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/23/23.
//

import SwiftUI
import UIKit
import Foundation

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Button("Login", action: checkValidLogin)
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(Color(UIColor.brb.white))
                    .tint(Color(UIColor.brb.red))
                    .offset(y:4)
            }
            .frame(width:UIScreen.main.bounds.size.width - 64)
            .navigationTitle("Login")
        }
    }
}

private func checkValidLogin() {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
