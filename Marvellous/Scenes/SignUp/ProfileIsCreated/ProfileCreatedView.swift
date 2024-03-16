//
//  ProfileCreatedView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct ProfileCreatedView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ProfileIsCreatedViewModel
    
    var body: some View {
        
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                
                VStack {
                    Text("Your Profile Is Created")
                    Text("Successfully!!")
                }
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
                
                
                Image(viewModel.avatarImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .shadow(color: .red, radius: 30)
                
                Text(viewModel.username)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                ButtonComponentView(title: "Let's Get Started!!!", action: {
                    
                    Task {
                        await viewModel.updateUser()
                    }
                }, backgroundColor: .red, isDisabled: false)
                .padding()
                
                
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ProfileCreatedView(viewModel: ProfileIsCreatedViewModel(avatarImageName: "ThanosAvatarImage", username: "Thanos", userManager: UserManager(), authenticationManager: AuthenticationManager()))
}
