//
//  CircleView.swift
//  Dogs
//
//  Created by Dylan Caetano on 24/06/2024.
//

import SwiftUI

struct CircleView: View {
    
    @State public var ShapeColor: Color
    @State public var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color.gradient.ignoresSafeArea()
        CircleView(ShapeColor: Color.color3, ShapeOpacity: 0.1)
    }
}
