//
//  Language.swift
//  Profile
//
//  Created by Ваня Науменко on 21.03.24.
//

import SwiftUI

struct Language: View {
    @State private var selectedOneButtun = false
    @State private var selectedTwoButtun = false

    @State private var buttonColor = Color.grayLighter
    @State private var buttonColorTwo = Color.grayLighter
    var body: some View {
        ScrollView {
            Spacer()
            Button(action: {
                buttonColor = buttonColor == Color.grayLighter ? Color.purplePrimary : Color.grayLighter
                selectedOneButtun.toggle()
            }) {
                Text("English")
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.1, alignment: .leading)
                    .foregroundColor(.black)
                    .padding()
                    .background(buttonColor)
                    .cornerRadius(10)
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 1.1)
            .overlay {
                if selectedOneButtun {
                    Image(systemName: "checkmark")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            Button(action: {
                buttonColorTwo = buttonColorTwo == Color.grayLighter ? Color.purplePrimary : Color.grayLighter
                selectedTwoButtun.toggle()
            }) {
                Text("Rusian")
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.1, alignment: .leading)
                    .foregroundColor(.black)
                    .padding()
                    .background(buttonColorTwo)
                    .cornerRadius(10)
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 1.1)
            .overlay {
                if selectedTwoButtun {
                    Image(systemName: "checkmark")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
//            Button(action: {
//                buttonColor = buttonColor == Color.v ? Color.blackPrimary : Color.v
//            }) {
//                Text("Russian")
//                    .foregroundColor(.black)
//                    .padding()
//                    .background(buttonColor)
//                    .cornerRadius(10)
//            }
        }
    }
}

#Preview {
    Language()
}
