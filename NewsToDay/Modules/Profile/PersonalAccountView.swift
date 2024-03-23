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
    @State private var isAlertPresenting = false
    private let router: RouterService
    @State private var username = ""
    @State private var email = ""
    
    init(router: RouterService) {
        self.router = router
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 40) {
                HStack {
                    ProfileHeaderView()
                    AccountDetailsView(username: $username, email: $email)
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
                    Button(
                        action: {
                            Task {
                                @MainActor in
                                
                                guard await AuthorizeService.shared.logout() else {
                                    isAlertPresenting = true
                                    return
                                }
                                router.openAuth()
                            }
                        },
                        label: {
                            HStack {
                                Text("Log Out")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Image(.iconSignout).renderingMode(.template)
                            }
                            .foregroundColor(.grayDarker)
                            .padding(.init(top: 16, leading: 24, bottom: 16, trailing: 24))
                            .background(Color.grayLighter)
                            .clipShape(.rect(cornerRadius: 12))
                        }
                    )
                }
            }
            .padding()
            .navigationTitle("Profile")
            .alert(
                "Something go wrong",
                isPresented: $isAlertPresenting,
                actions: {
                    Button("OK") { }
                }
            )
            .task {
                @MainActor in
                
                username = (try? await StorageService.shared.getUserName()) ?? ""
                email = (try? await StorageService.shared.getUserEmail()) ?? ""
            }
        }
    }
}

// MARK: - PersonalAccountView_Previews

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView(router: .init())
    }
}
