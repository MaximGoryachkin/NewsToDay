//
//  AccountDetailsView.swift
//  Profile
//
//  Created by Ваня Науменко on 20.03.24.
//

import SwiftUI
struct AccountDetailsView: View {
    
    @Binding var username: String
    @Binding var email: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(username)
                .font(.title)
                .fontWeight(.bold)
            Text(email)
        }
        .padding()
    }
}

#Preview {
    AccountDetailsView(username: .constant("username"), email: .constant("email@mail.ru"))
}
