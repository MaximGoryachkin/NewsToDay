//
//  PersonalAccountView.swift
//  Profile
//
//  Created by Ваня Науменко on 20.03.24.
//
import SwiftUI

// MARK: - PersonalAccountView

struct PersonalAccountView: View {
    @Environment(\.dismiss) var dismiss
    @State private var termsAndConditionsView = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                HStack {
                    ProfileHeaderView()
                    AccountDetailsView()
                }

                NavLinkButton(
                    label: "Language",
                    destination: Language()
                ).overlay {
                    Image(systemName: "chevron.right")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Spacer()
                VStack(spacing: 30) {
                        NavLinkButton(
                            label: "Terms & Conditions",
                            destination: TermsAndConditionsView()
                        ).overlay {
                            Image(systemName: "chevron.right")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    NavLinkButton(
                        label: "Sing Out",
                        destination: OnboardingView()
                    ).overlay {
                        Image(systemName: "ipad.and.arrow.forward")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .padding()
            .navigationTitle("Profile")
            
        }
    }
}

// MARK: - PersonalAccountView_Previews

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView()
    }
}
