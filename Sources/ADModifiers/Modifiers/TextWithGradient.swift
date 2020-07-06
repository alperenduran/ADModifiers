//
//  File.swift
//  
//
//  Created by Alperen Duran on 6.07.2020.
//

import SwiftUI
import Foundation

@available(iOS 13.0, *)
struct GradientModifier: ViewModifier {
    var gradient: LinearGradient
    func body(content: Content) -> some View {
        content
            .overlay(gradient)
            .mask(content)
    }
}

@available(iOS 13.0, *)
public extension Text {
    func gradientForeground(
        _ gradient: LinearGradient
    ) -> some View {
        self
            .modifier(
                GradientModifier(gradient: gradient)
        )
    }
}
