//
//  NavLinkButton.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

struct NavLinkButton<Destination: View>: View {
    let label: String
    let destination: Destination

    init(label: String, destination: Destination) {
        self.label = label
        self.destination = destination
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
                    NavigationLink(destination: destination) {
                                
                        Text(label)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.black)
                            .padding()
                            .frame(maxWidth: UIScreen.main.bounds.width / 1.1)
                            .background(Color.grayLighter)
                            .cornerRadius(15)
                        
                            
                    }
    }
}

#Preview {
    NavigationView {
        NavLinkButton(label: "new text", destination: EmptyView())
    }
}
