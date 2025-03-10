import SwiftUI

/// Button style that scales the button when pressed
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

/// Button style for category selection buttons
struct CategoryButtonStyle: ButtonStyle {
    let isSelected: Bool
    let category: QuestionCategory
    
    init(isSelected: Bool, category: QuestionCategory) {
        self.isSelected = isSelected
        self.category = category
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? ColorTheme.colorFor(category: category) : ColorTheme.cardBackground)
            )
            .foregroundColor(isSelected ? .white : ColorTheme.textSecondary)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(isSelected ? Color.clear : ColorTheme.colorFor(category: category).opacity(0.5), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

/// Button style for the main Truth button
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(ColorTheme.textPrimary)
            .padding(.vertical, 15)
            .padding(.horizontal, 50)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [ColorTheme.primary, ColorTheme.secondary]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(15)
            .shadow(color: ColorTheme.primary.opacity(0.5), radius: 10, x: 0, y: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
} 