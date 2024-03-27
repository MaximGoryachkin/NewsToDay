//
//  TitleHeaderView.swift
//  NewsToDay
//
//  Created by Victor on 27.03.2024.
//

import SwiftUI

struct TitleHeaderView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        Text(title)
            .font(.interSemiBold24)
            .foregroundColor(.blackPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: 28, leading: .zero, bottom: 8, trailing: .zero))
        Text(subtitle)
            .font(.interRegular16)
            .foregroundColor(.grayPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: .zero, leading: .zero, bottom: 32, trailing: .zero))
    }
}
