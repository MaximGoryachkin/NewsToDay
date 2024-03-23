//
//  OnboardingView.swift
//  Profile
//
//  Created by Ваня Науменко on 20.03.24.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var xPoint: CGFloat = 318
    @State private var counter = 0
    @State private var contentSize: CGFloat = 318
    @State private var data = OnboardingData()
    private let spacing: CGFloat = 30
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: spacing) {
                ForEach(data.data) { data in
                    OnboardingCardView(data: data)
                        .offset(x: xPoint)
                }
            }
            .padding()
            
            HStack(spacing: 10) {
                ForEach(data.data, id: \.id) { data in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(data.id == counter ? .black : .gray)
                }
            }
            .padding()
            
            Text(data.data[counter].firstLabel)
                .font(.interSemiBold24)
                .padding()
            
            Text(data.data[counter].secondLabel)
                .font(.interRegular16)
                .foregroundStyle(Color.grayPrimary)
                .frame(width: 216)
                .multilineTextAlignment(.center)
                .padding()
          
            OnboardingButtonView(title: data.data[counter].buttonTitle) {
                data.updateModel(with: counter)
                counter += 1
                if counter <= 2 {
                    xPoint -= contentSize
                } else {
                    dismiss()
                }
                data.updateModel(with: counter)
            }
            
        }
        .animation(.spring)
    }
}



#Preview {
    OnboardingView()
}
