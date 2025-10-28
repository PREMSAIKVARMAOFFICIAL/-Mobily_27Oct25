//
//  PromotionCard.swift
//  Mobily_27Oct25
//
//  Created by Prem Sai K Varma on 10/27/25.
//

import SwiftUI

struct PromotionCard: View {
    let promotion: Promotion
    @State private var pressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(promotion.title)
                .font(.headline)
            Text(promotion.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            HStack {
                Spacer()
                Button(promotion.advertisement) {
                }
                    .buttonStyle(.borderedProminent)
                    .scaleEffect(pressed ? 0.96 : 1)
                    .onLongPressGesture(
                        minimumDuration: 0.01,
                        pressing: {
                            tapped in withAnimation(
                                .spring
                            ) {
                                pressed = tapped
                            }
                        },
                        perform: {
                        })
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.thinMaterial)
                .shadow(radius: 4)
        )
    }
}

#Preview {
    PromotionCard(
        promotion: Promotion(
            title: "Weekend Data Boost",
            description: "Get 10GB extra every weekend for streaming and games!",
            advertisement: "Subscribe"
        )
    )
}
