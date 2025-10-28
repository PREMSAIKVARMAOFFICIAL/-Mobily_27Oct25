//
//  ContentView.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RootTabView()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppContainer.live)
        .padding()
}
