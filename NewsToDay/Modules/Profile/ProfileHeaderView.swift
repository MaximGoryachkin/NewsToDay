//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Ваня Науменко on 20.03.24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            Image("UserFoto")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(.circle)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
