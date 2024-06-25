//
//  OnBoardingView.swift
//  Dogs
//
//  Created by Dylan Caetano on 21/06/2024.
//

import SwiftUI

struct OnBoardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Dogs."
    
    var body: some View {
        ZStack {
            Color.gradient.ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 55))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.color3)
                        .transition(.opacity)
                        .id(textTitle)
                    Text("Et on fait un petit WAF !")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(Color.color3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                Spacer()
                
                ZStack {
                    CircleView(ShapeColor: .color3, ShapeOpacity: 0.1)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("Dog")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "WAFFF"
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Dogs."
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                
                Spacer()
                
                .overlay (
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .bold))
                        .foregroundStyle(Color.color3)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeInOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .fill(Color.color3.opacity(0.2))
                    Capsule()
                        .fill(Color.color3.opacity(0.2))
                        .padding(8)
                    Text("Commencer")
                        .font(.system(.title3, design: .rounded))
                        .bold()
                        .foregroundStyle(Color.color3)
                        .offset(x: 20)
                    HStack {
                        Capsule()
                            .fill(Color.color1)
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                       
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.color2)
                            Circle()
                                .fill(Color.color3)
                                .padding(8)
                            Image(systemName: "chevron.compact.right")
                                .font(.system(size: 34, weight: .bold))
                        }
                        .foregroundStyle(Color.color1)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )
                        
                        Spacer()
                        
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnBoardingView()
}
