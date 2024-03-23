//
//  CardView.swift
//  NewsToDay
//
//  Created by Максим Горячкин on 23.03.2024.
//

import SwiftUI

struct OnboardingCardView: View {
    var width: CGFloat {
        288
    }
    var height: CGFloat {
        336
    }
    var data: OnboardingModel
    
    var body: some View {
        Image(data.image)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: width, height: data.isShow ? height : height * 0.9)
    }
}
