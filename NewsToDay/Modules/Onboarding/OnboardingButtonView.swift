//
//  OnboardingButtonView.swift
//  NewsToDay
//
//  Created by Максим Горячкин on 23.03.2024.
//

import SwiftUI

struct OnboardingButtonView: View {
    let title: String
    let tap: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 56)
            .foregroundStyle(Color.purplePrimary)
            .padding()
            .overlay {
                Text(title)
                    .font(.interSemiBold16)
                    .foregroundStyle(.white)
            }
            .onTapGesture(perform: tap)
    }
}

#Preview {
    OnboardingButtonView(title: "123", tap: {})
}
