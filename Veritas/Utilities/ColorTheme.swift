import SwiftUI

/// Color theme for the Veritas app
struct ColorTheme {
    // Primary brand colors
    static let primary = Color(hex: "5E17EB") // Vibrant purple
    static let secondary = Color(hex: "FF3366") // Energetic pink
    static let accent = Color(hex: "17EBBB") // Teal accent
    
    // Background colors
    static let background = Color(hex: "121212") // Dark background
    static let cardBackground = Color(hex: "1E1E1E") // Slightly lighter for cards
    
    // Text colors
    static let textPrimary = Color.white // White text
    static let textSecondary = Color(hex: "BBBBBB") // Light gray text
    
    // Category colors
    static let casual = Color(hex: "17EBBB") // Teal for casual
    static let deep = Color(hex: "5E17EB") // Purple for deep
    static let spicy = Color(hex: "FF3366") // Pink for spicy
    static let funny = Color(hex: "FFC107") // Amber for funny
    static let drinking = Color(hex: "FF6B00") // Orange for drinking
    static let neverHaveI = Color(hex: "4CAF50") // Green for never have I
    static let campusLife = Color(hex: "2196F3") // Blue for campus life
    static let partyDares = Color(hex: "E91E63") // Pink/Red for party dares
    
    // Returns color for a specific category
    static func colorFor(category: QuestionCategory) -> Color {
        switch category {
        case .casual: return casual
        case .deep: return deep
        case .spicy: return spicy
        case .funny: return funny
        case .drinking: return drinking
        case .neverHaveI: return neverHaveI
        case .campusLife: return campusLife
        case .partyDares: return partyDares
        }
    }
}

// Helper extension to use hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
} 