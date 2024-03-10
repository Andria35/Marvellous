//
//  AvatarImageComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct AvatarImageComponentView: View {
    
    let avatarImageName: String
    @Binding var selectedImage: String
    
    var body: some View {
        Image(avatarImageName)
            .overlay(
                Color.gray.opacity(selectedImage == avatarImageName ? 0.4 : 0.0)
                    .clipShape(.circle)
            )
            .onTapGesture {
                withAnimation {
                    selectedImage = avatarImageName
                }
            }

    }
}

#Preview {
    ZStack {
        MainBackgroundComponentView()
        AvatarImageComponentView(avatarImageName: "VenomAvatarImage", selectedImage: .constant(""))
    }
}
