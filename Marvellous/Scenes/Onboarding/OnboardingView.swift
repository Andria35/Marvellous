//
//  OnboardingView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Properties
    enum TabViewTabs {
        case firstWelcomeView
        case secondWelcomeView
        case thirdWelcomeView
        case fourthWelcomeView
    }
    @State var selectedTab: TabViewTabs = .firstWelcomeView
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            FirstWelcomeView() {
                selectedTab = .secondWelcomeView
            }
            .tag(TabViewTabs.firstWelcomeView)
            SecondWelcomeView() {
                selectedTab = .thirdWelcomeView
            }
            .tag(TabViewTabs.secondWelcomeView)
            ThirdWelcomeView() {
                selectedTab = .fourthWelcomeView
            }
            .tag(TabViewTabs.thirdWelcomeView)
            FourthWelcomeView() {
                
            }
            .tag(TabViewTabs.fourthWelcomeView)
            
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)

    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
