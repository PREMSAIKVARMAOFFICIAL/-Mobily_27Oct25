//
//  PromotionsCarouselView.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct PromotionsCarouselView: View {
    let promotions: [Promotion]
    @State private var index: Int = 0
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(Array(promotions.enumerated()), id: \ .offset) { idx, promo in
                PromotionCard(promotion: promo)
                    .tag(idx)
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 160)
        .onAppear {
            autoAdvance()
        }
    }
    
    func autoAdvance() {
        guard promotions.count > 1 else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
            withAnimation(.smooth) {
                index = (index + 1) % promotions.count
            }
        }
    }
}

#Preview {
    PromotionsCarouselView(promotions: [
        Promotion(
            title: "Super Saver 499",
            description: "Save more on 5GB/day with unlimited calls.",
            advertisement: "Know More"
        ),
        Promotion(
            title: "Weekend Data Boost",
            description: "Extra 10GB every weekend for binge sessions!",
            advertisement: "Subscribe"
        )
    ])
}
