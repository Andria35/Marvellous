//
//  AvatarImageComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct AvatarImageComponentView: View {
    
    let avatarImageName: String
    @State var isSelecter: Bool = false
    
    var body: some View {
        Image(avatarImageName)
            .overlay(
                Color.gray.opacity(isSelecter ? 0.2 : 0.0)
                    .clipShape(.circle)
            )
            .onTapGesture {
                withAnimation {
                    isSelecter.toggle()
                }
            }

    }
}

#Preview {
    ZStack {
        MainBackgroundComponentView()
        AvatarImageComponentView(avatarImageName: "VenomAvatarImage")
    }
}
