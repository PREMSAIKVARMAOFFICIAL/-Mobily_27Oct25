//
//  PlansPreview.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct PlansPreview: View {
    @EnvironmentObject private var container: AppContainer
    @StateObject private var viewModel = PlansViewModel(planService: MockDataService())
    
    var body: some View {
        PlansListView(viewModel: viewModel)
            .frame(minHeight: 220)
    }
}

#Preview {
    PlansPreview()
}
