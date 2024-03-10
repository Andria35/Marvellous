//
//  EnterUsernameView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct EnterUsernameView: View {
    
    // MARK: - Properties
    let selectedAvatarImageName: String
    @State var usernameTextfieldText: String = ""
    @EnvironmentObject var router: Router
    
    // MARK: - Body
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
                
                VStack {
                    Image(selectedAvatarImageName)
                    Text("Change")
                        .foregroundStyle(.red)
                        .fontWeight(.bold)
                        .onTapGesture {
                            router.navigateBack()
                        }
                }
                
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
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    EnterUsernameView(selectedAvatarImageName: "UltronAvatarImage")
}
