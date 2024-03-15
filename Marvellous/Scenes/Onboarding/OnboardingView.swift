//
//  OnboardingView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var onboardingIsPresented: Bool
    @Binding var showLogIn: Bool
    
    // MARK: - Properties
    enum TabViewTabs {
        case firstWelcomeView
        case secondWelcomeView
        case thirdWelcomeView
        case fourthWelcomeView
        case fifthWelcomeView
        case authenticationView
    }
    @State var selectedTab: TabViewTabs = .firstWelcomeView
    
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            FirstWelcomeView() {
                withAnimation {
                    selectedTab = .secondWelcomeView
                }
            }
            .tag(TabViewTabs.firstWelcomeView)
            
            SecondWelcomeView() {
                withAnimation {
                    selectedTab = .thirdWelcomeView
                }
            }
            .tag(TabViewTabs.secondWelcomeView)
            
            ThirdWelcomeView() {
                withAnimation {
                    selectedTab = .fourthWelcomeView
                }
            }
            .tag(TabViewTabs.thirdWelcomeView)
            
            FourthWelcomeView() {
                withAnimation {
                    selectedTab = .fifthWelcomeView
                }
            }
            .tag(TabViewTabs.fourthWelcomeView)
            FifthWelcomeView() {
                withAnimation {
                    selectedTab = .authenticationView
                }
            }
            .tag(TabViewTabs.fifthWelcomeView)
            FinalWelcomeView(onboardingIsPresented: $onboardingIsPresented, showLogIn: $showLogIn)
                .tag(TabViewTabs.authenticationView)
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)
        
    }
}

// MARK: - Preview
#Preview {
    OnboardingView(onboardingIsPresented: .constant(true), showLogIn: .constant(true))
}
