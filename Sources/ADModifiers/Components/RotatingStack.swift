//
//  RotatingStack.swift
//  
//
//  Created by Alperen Duran on 21.05.2020.
//

import SwiftUI

public enum ScreenOrientation {
    case portrait
    case landscape
}

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public struct RotatingStack<Content>: View where Content : View {
    
    public var content: () -> Content
    public var spacing: CGFloat
    
    @inlinable public init(
        spacing: CGFloat = 8.0,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.spacing = spacing
    }
    
    private func getOrientation(from geometry: GeometryProxy) -> ScreenOrientation {
        geometry.size.width > geometry.size.height ? .landscape : .portrait
    }
    
    public var body: some View {
        GeometryReader { geometry in
            if self.getOrientation(from: geometry) == .portrait {
                VStack(spacing: self.spacing) {
                    self.content()
                }
            } else {
                HStack(spacing: self.spacing) {
                    self.content()
                }
            }
        }
    }
}
