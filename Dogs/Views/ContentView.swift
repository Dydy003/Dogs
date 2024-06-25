//
//  ContentView.swift
//  Dogs
//
//  Created by Dylan Caetano on 18/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnBoardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
