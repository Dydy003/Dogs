//
//  ExtensionColor.swift
//  Dogs
//
//  Created by Dylan Caetano on 21/06/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let color1 = Color("ColorOne")
    static let color2 = Color("ColorTwo")
    static let color3 = Color("Text")
    static let gradient = LinearGradient(colors: [color1, color2],
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing)
}
