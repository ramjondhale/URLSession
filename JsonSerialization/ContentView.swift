//
//  ContentView.swift
//  JsonSerialization
//
//  Created by Ram Jondhale on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()

    var body: some View {
        VStack(spacing: 10) {
            Button {
                networkManager.fetchDataWithURL()
            } label: {
                Text("Fetch data with URL")
            }

            Button("Post data") {
                networkManager.postData()
            }

            Button("Fetch data with URLRequest") {
                networkManager.getDataWithURLRequest()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
