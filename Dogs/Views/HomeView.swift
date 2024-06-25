//
//  HomeView.swift
//  Dogs
//
//  Created by Dylan Caetano on 20/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color.gradient.ignoresSafeArea()
            VStack(spacing: 20) {
                
                Spacer()
                
                ZStack {
                    CircleView(ShapeColor: .color3, ShapeOpacity: 0.1)
                    
                    Image("Dog2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 4)
                                .repeatForever()
                            , value: isAnimating
                        )
                }
                
                Text("Les chiens parlent, mais seulement à ceux qui savent écouter")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(Color.color3)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button {
                    withAnimation {
                        isOnboardingViewActive = true
                    }
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                        .foregroundStyle(Color.color1)
                    
                    Text("Retour")
                        .foregroundStyle(Color.color1)
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                .tint(Color.color3)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    isAnimating = true
                })
            })
        }
    }
}

#Preview {
    HomeView()
}
