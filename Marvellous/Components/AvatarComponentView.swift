//
//  AvatarComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct AvatarComponentView: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
           
    }
}

#Preview {
    ZStack {
        MainBackgroundComponentView()
        AvatarComponentView(imageName: "VenomAvatarImage")
    }
    
}
