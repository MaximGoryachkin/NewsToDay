//
//  AccountDetailsView.swift
//  Profile
//
//  Created by Ваня Науменко on 20.03.24.
//

import SwiftUI
struct AccountDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ivan")
                .font(.title)
                .fontWeight(.bold)
            Text("example@example.com")
        }
        .padding()
    }
}

#Preview {
    AccountDetailsView()
}
