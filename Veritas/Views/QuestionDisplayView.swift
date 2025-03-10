import SwiftUI

/// View component for displaying the current question
struct QuestionDisplayView: View {
    let question: String
    let category: QuestionCategory
    @State private var randomEmoji: String = "✨"
    
    var body: some View {
        VStack(spacing: 16) {
            // Category indicator with emoji
            HStack(spacing: 8) {
                Text(EmojiTheme.emojiFor(category: category))
                    .font(.title3)
                
                Text(category.rawValue)
                    .font(.headline)
                    .foregroundColor(ColorTheme.colorFor(category: category))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(ColorTheme.colorFor(category: category).opacity(0.15))
            )
            
            // Question text
            Text(question)
                .font(.title2)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorTheme.textPrimary)
                .padding(24)
                .frame(minHeight: 160)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(ColorTheme.cardBackground)
                        .shadow(color: ColorTheme.colorFor(category: category).opacity(0.3), radius: 15, x: 0, y: 4)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    ColorTheme.colorFor(category: category).opacity(0.7),
                                    ColorTheme.colorFor(category: category).opacity(0.3)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
            
            // Random emoji reaction
            if question != "Select a category and tap Truth" {
                Text(randomEmoji)
                    .font(.system(size: 32))
                    .padding(.top, -5)
            }
        }
        .padding(.horizontal, 20)
        .transition(AnyTransition.scale(scale: 0.1, anchor: .center)
            .combined(with: .opacity))
        .id(question) // Important for animation
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: question)
        .onChange(of: question) { newValue in
            if newValue != "Select a category and tap Truth" {
                randomEmoji = EmojiTheme.randomReactionFor(category: category)
            }
        }
    }
} 