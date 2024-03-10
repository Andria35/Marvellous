//
//  AvatarImageComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct AvatarImageComponentView: View {
    
    let avatarImageName: String
    @Binding var selectedImageName: String?
    
    var body: some View {
        Image(avatarImageName)
            .overlay(
                Color.gray.opacity(selectedImageName == avatarImageName ? 0.4 : 0.0)
                    .clipShape(.circle)
            )
            .onTapGesture {
                withAnimation {
                    selectedImageName = avatarImageName
                }
            }

    }
}

#Preview {
    ZStack {
        MainBackgroundComponentView()
        AvatarImageComponentView(avatarImageName: "VenomAvatarImage", selectedImageName: .constant(""))
    }
}
