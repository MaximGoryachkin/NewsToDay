//
//  OnboardingModel.swift
//  NewsToDay
//
//  Created by Максим Горячкин on 23.03.2024.
//

import Foundation

struct OnboardingModel: Identifiable {
    var id: Int
    var image: String
    var buttonTitle: String
    var firstLabel: String
    var secondLabel: String
    var isShow: Bool
}

struct OnboardingData {
    var data = [OnboardingModel(id: 0, 
                                image: "onboarding.0",
                                buttonTitle: "Next",
                                firstLabel: "First to know",
                                secondLabel: "All news in one place, be the first to know last news",
                                isShow: true),
                       OnboardingModel(id: 1, 
                                       image: "onboarding.1",
                                       buttonTitle: "Next",
                                       firstLabel: "Better articles",
                                       secondLabel: "The best news from around the world",
                                       isShow: false),
                       OnboardingModel(id: 2, 
                                       image: "onboarding.2", 
                                       buttonTitle: "Get Started",
                                       firstLabel: "Smart recommendations",
                                       secondLabel: "Set up recommendations for easy reading",
                                       isShow: false)]
    
    mutating func updateModel(with index: Int) {
        data[index].isShow.toggle()
    }
}
