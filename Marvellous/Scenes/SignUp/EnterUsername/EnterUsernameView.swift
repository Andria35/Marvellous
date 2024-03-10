//
//  EnterUsernameView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct EnterUsernameView: View {
    
    @State var usernameTextfieldText: String = ""
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                Text("Enter Your Username")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                Image("VenomAvatarImage")
                
                TextField("Username", text: $usernameTextfieldText)
                    .padding()
                    .font(.title2)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                    .padding(.horizontal)
                Spacer()
                
                ButtonComponentView(title: "Call Me This", action: {}, backgroundColor: nil, isDisabled: false)
                    .padding()
            }
        }
    }
}

#Preview {
    EnterUsernameView()
}
