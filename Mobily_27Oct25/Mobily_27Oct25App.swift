//
//  Mobily_27Oct25App.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

@main
struct Mobily_27Oct25App: App {
    private var container = AppContainer.live
    
    var body: some Scene {
        WindowGroup {
            RootTabView()
            .environmentObject(container)
            .preferredColorScheme(.dark)
        }
    }
}
