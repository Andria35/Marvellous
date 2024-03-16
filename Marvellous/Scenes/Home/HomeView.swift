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
            Text("\(viewModel.user?.email ?? "hehe")")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(userId: "nKSj3D9VQDOQD7W67yGGPWZ4bfo1", userManager: UserManager()))
}
