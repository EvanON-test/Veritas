import SwiftUI
import UIKit

/// Main content view for the Veritas app
struct ContentView: View {
    // Initialize the ViewModel
    @StateObject private var viewModel = QuestionViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        ColorTheme.background,
                        ColorTheme.background.opacity(0.9)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                // Animated background emoji particles for visual interest
                EmojiBubbleBackground()
                
                // Content with proper safe area handling
                VStack(spacing: 0) {
                    // Safe area spacer to ensure content is below the notch
                    Spacer()
                        .frame(height: 10)
                        .background(ColorTheme.background)
                    
                    // Main content
                    VStack(spacing: 30) {
                        // App title with emoji
                        HStack(spacing: 12) {
                            Text("✨")
                                .font(.system(size: 32))
                            
                            Text("VERITAS")
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                                .foregroundColor(ColorTheme.primary)
                            
                            Text("✨")
                                .font(.system(size: 32))
                        }
                        .padding(.top, 60) // Increased padding to ensure title is visible below notch
                        
                        // Category selection component
                        CategorySelectionView(viewModel: viewModel, onCategorySelected: { category in
                            viewModel.selectCategory(category)
                        })
                        
                        Spacer()
                        
                        // Question display component
                        QuestionDisplayView(
                            question: viewModel.currentQuestion,
                            category: viewModel.selectedCategory
                        )
                        
                        Spacer()
                        
                        // Truth button
                        Button(action: {
                            // Add haptic feedback
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                            
                            // Generate a new random question
                            withAnimation(.easeInOut(duration: 0.5)) {
                                viewModel.generateRandomQuestion()
                            }
                        }) {
                            HStack(spacing: 10) {
                                Text(EmojiTheme.truth)
                                    .font(.system(size: 24))
                                
                                Text("TRUTH")
                                    .padding(.vertical, 15)
                                    .padding(.trailing, 10)
                            }
                            .padding(.leading, 40)
                            .padding(.trailing, 30)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        .padding(.bottom, 20)
                        
                        // Family-friendly mode toggle component
                        FamilyModeToggleView(viewModel: viewModel)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

/// Animated emoji bubble background for visual interest
struct EmojiBubbleBackground: View {
    let emojis = ["✨", "🔥", "❤️", "😂", "🤔", "👀", "🎮", "🎯", "🌈", "🧠"]
    let animationDuration: Double = 15.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<10) { index in
                    EmojiBubble(
                        emoji: emojis[index % emojis.count],
                        size: CGFloat.random(in: 20...40),
                        position: CGPoint(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        ),
                        duration: animationDuration,
                        delay: Double.random(in: 0...5)
                    )
                }
            }
        }
        .ignoresSafeArea()
        .opacity(0.15)
    }
}

/// Single emoji bubble that floats and fades
struct EmojiBubble: View {
    let emoji: String
    let size: CGFloat
    let position: CGPoint
    let duration: Double
    let delay: Double
    
    @State private var isAnimating = false
    
    var body: some View {
        Text(emoji)
            .font(.system(size: size))
            .position(position)
            .opacity(isAnimating ? 0 : 0.7)
            .offset(y: isAnimating ? -100 : 0)
            .onAppear {
                withAnimation(
                    Animation
                        .easeInOut(duration: duration)
                        .repeatForever(autoreverses: false)
                        .delay(delay)
                ) {
                    isAnimating = true
                }
            }
    }
}

#Preview {
    ContentView()
} 