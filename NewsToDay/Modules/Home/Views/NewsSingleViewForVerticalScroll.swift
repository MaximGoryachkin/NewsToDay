//
//  NewsSingleView(for vertical).swift
//  NewsToDay
//
//  Created by Юрий on 23.03.2024.
//

import SwiftUI

struct NewsSingleViewForVerticalScroll: View {
    
    var category: String
    var title: String
    var image: String
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    Text(category)
                        .font(Font.interRegular16)
                        .foregroundColor(Color.grayPrimary)
                        .padding(.bottom, 10)
                    
                    Text(title)
                        .foregroundColor(.black)
                        .font(Font.interMedium16)
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewsSingleViewForVerticalScroll(category: "Design", title: "A Simple Trick For Creating", image: "NewsImage")
}
