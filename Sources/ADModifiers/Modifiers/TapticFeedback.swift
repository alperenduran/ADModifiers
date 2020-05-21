import SwiftUI
import Foundation

@available(iOS 13.0, *)
public extension View {
    func tapticFeedback(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
