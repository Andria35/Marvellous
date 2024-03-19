//
//  HomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack {
                Image(viewModel.user?.avatarImageName ?? "")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .shadow(color: .red, radius: 10)
                Text("\(viewModel.user?.username ?? "")")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(userId: "yBZ8pk3yLFROG5ZaFcOTKm4WxaC2", userManager: UserManager()))
}
