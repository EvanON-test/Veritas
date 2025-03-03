//
//  ContentView.swift
//  Veritas
//
//  Created by Evan Neale on 03/03/2025.
//

import SwiftUI
import UIKit

// Define question categories
enum QuestionCategory: String, CaseIterable {
    case casual = "Casual"
    case deep = "Deep"
    case spicy = "Spicy"
    case funny = "Funny"
    
    var isFamilyFriendly: Bool {
        switch self {
        case .casual, .funny:
            return true
        case .deep, .spicy:
            return false
        }
    }
    
    var questions: [String] {
        switch self {
        case .casual:
            return [
                "What's your favorite childhood memory?",
                "What's the last white lie you told?",
                "What's your guilty pleasure TV show?",
                "What's the most embarrassing song on your playlist?",
                "What's your worst fashion mistake?",
                "What's your go-to comfort food?",
                "What hobby did you enjoy as a child that you still cherish?",
                "What's the best vacation you've ever taken?",
                "How do you like to spend a lazy Sunday?",
                "What's a small, unexpected act of kindness you've experienced?",
                "What local spot do you love to visit on weekends?",
                "What's your favorite way to unwind after a busy day?",
                "Which book has left a lasting impression on you?",
                "What's one habit you picked up recently that makes life easier?",
                "What's a quirky tradition you have with your friends?",
                "What's your favorite way to relax after a hectic week?",
                "Which movie could you watch over and over again?",
                "What was your favorite toy as a kid?",
                "Do you prefer sunrise or sunset, and why?",
                "What's a memorable conversation you had with a stranger?",
                "Which local event do you never miss?",
                "What's the best compliment you've ever received?",
                "What's your favorite outdoor activity?",
                "What's the best meal you've ever cooked?",
                "Which song instantly lifts your mood?"
            ]
            
        case .deep:
            return [
                "What's your biggest fear in life?",
                "What's something you've never told anyone?",
                "What's your biggest regret?",
                "What would you change about your past if you could?",
                "What's the hardest truth you've had to accept?",
                "What is the most challenging decision you've ever made?",
                "How do you define the purpose of your life?",
                "What belief do you hold that most people might disagree with?",
                "What's a transformative experience that changed your outlook?",
                "How do you reconcile with the inevitability of change?",
                "What does true happiness mean to you?",
                "What's a moral dilemma that continues to intrigue you?",
                "What is the most profound lesson you've learned so far?",
                "How do you measure personal success?",
                "What aspect of your character would you most like to improve?",
                "What life event fundamentally changed you?",
                "How do you find meaning during difficult times?",
                "What is the most important lesson that adversity has taught you?",
                "How do you define integrity in your personal life?",
                "What internal conflict do you struggle with the most?",
                "What role does fate play in your life, in your opinion?",
                "How do you prioritize personal growth over material gain?",
                "What does legacy mean to you?",
                "How do you deal with existential questions about life?",
                "What unresolved question do you find yourself returning to?"
            ]
            
        case .spicy:
            return [
                "What's your biggest turn-off?",
                "What's your most adventurous fantasy?",
                "What's your ideal romantic evening?",
                "What's your definition of perfect chemistry?",
                "What's the most spontaneous thing you've done for love?",
                "What secret desire have you never dared to reveal?",
                "How do you explore your boundaries in relationships?",
                "What's the boldest thing you've ever done?",
                "Can you share a wild crush story?",
                "What are your thoughts on love at first sight?",
                "How do you handle vulnerability in intimate moments?",
                "What role does passion play in your relationships?",
                "Which personal trait do you find most alluring?",
                "What's the most flirtatious encounter you've experienced?",
                "What's the riskiest romantic gesture you've ever attempted?",
                "What's a secret you've always wanted to confess?",
                "How do you define a thrilling encounter?",
                "What's the naughtiest thought you've had lately?",
                "Which taboo topic intrigues you the most?",
                "How do you feel about taking risks in love?",
                "What's your take on mixing spontaneity with intimacy?",
                "What's the boldest flirtation you've ever experienced?",
                "Which aspect of romance challenges your comfort zone?",
                "What unexpected quality in a partner excites you?",
                "How do you balance vulnerability with seduction?"
            ]
            
        case .funny:
            return [
                "What's the most ridiculous thing you've done for attention?",
                "What's your most embarrassing moment?",
                "What's the worst advice you've ever given?",
                "What's the silliest thing you're secretly proud of?",
                "What's your most irrational fear?",
                "What's the funniest joke you know by heart?",
                "Which quirky habit of yours never fails to amuse others?",
                "What's the weirdest dream you've ever had?",
                "What's the most awkward situation you've found yourself in?",
                "What fashion trend did you follow that now makes you laugh?",
                "What's the funniest miscommunication you've experienced?",
                "What's your go-to humorous story at parties?",
                "What's the strangest food combination that you actually enjoy?",
                "What's the most memorable prank you've ever pulled?",
                "What's a comically epic mistake you've made at work?",
                "What's the oddest misunderstanding you've ever had?",
                "Have you ever laughed at a completely inappropriate moment?",
                "What's a hilarious habit your pet (or friend) has that you find amusing?",
                "What's the funniest way you ever injured yourself?",
                "What's the most absurd rumor you've heard about yourself?",
                "What's a comical cultural misunderstanding you've experienced?",
                "How do you react when you realize you've been laughing at your own joke?",
                "What's the most ludicrous excuse you've used to get out of a situation?",
                "Which meme always cracks you up no matter what?",
                "What's the quirkiest thing that always makes you smile?"
            ]
        }
    }
}

struct ContentView: View {
    @State private var currentQuestion: String = "Select a category and tap Truth"
    @State private var selectedCategory: QuestionCategory = .casual
    @State private var isFamilyFriendlyMode: Bool = false
    
    // Filtered categories based on family-friendly mode
    private var availableCategories: [QuestionCategory] {
        if isFamilyFriendlyMode {
            return QuestionCategory.allCases.filter { $0.isFamilyFriendly }
        } else {
            return QuestionCategory.allCases
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 30) {
                // Safe area spacer to ensure content is below the notch
                Spacer()
                    .frame(height: 20)
                
                // Category Selector - centered and contained
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            // Add leading spacer for centering
                            Spacer(minLength: 0)
                            
                            ForEach(availableCategories, id: \.self) { category in
                                Button(action: {
                                    withAnimation {
                                        selectedCategory = category
                                        // Scroll to the selected category
                                        scrollView.scrollTo(category, anchor: .center)
                                    }
                                    // Add haptic feedback for category selection
                                    let impact = UIImpactFeedbackGenerator(style: .light)
                                    impact.impactOccurred()
                                }) {
                                    Text(category.rawValue)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(selectedCategory == category ? Color.black : Color.black.opacity(0.05))
                                        )
                                        .foregroundColor(selectedCategory == category ? .white : .black)
                                }
                                .id(category)
                                .buttonStyle(PlainButtonStyle())
                                .contentShape(Rectangle())
                            }
                            
                            // Add trailing spacer for centering
                            Spacer(minLength: 0)
                        }
                    }
                    .onAppear {
                        // Scroll to initial category
                        scrollView.scrollTo(selectedCategory, anchor: .center)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Question text with scale transition
                Text(currentQuestion)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .transition(AnyTransition.scale(scale: 0.1, anchor: .center)
                        .combined(with: .opacity))
                    .id(currentQuestion)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: currentQuestion)
                    .frame(height: 200)
                
                Spacer()
                
                Button(action: {
                    // Add haptic feedback
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    
                    // Scale animation transition
                    withAnimation(.easeInOut(duration: 0.5)) {
                        currentQuestion = selectedCategory.questions.randomElement() ?? "No question available"
                    }
                }) {
                    Text("Truth")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 50)
                        .background(Color.black)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .buttonStyle(ScaleButtonStyle())
                .padding(.bottom, 20) // Reduced from 50 to make room for the toggle
                
                // Family-friendly mode toggle
                VStack(spacing: 4) {
                    Toggle(isOn: $isFamilyFriendlyMode.animation()) {
                        Text("Family-Friendly Mode")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .black))
                    .padding(.horizontal, 40)
                    
                    Text(isFamilyFriendlyMode ? "Adult content hidden" : "All content visible")
                        .font(.caption)
                        .foregroundColor(Color(white: 0.5))
                        .padding(.bottom, 4)
                }
                .padding(.bottom, 30)
                .onChange(of: isFamilyFriendlyMode) { newValue in
                    // If current category is not family-friendly, switch to casual
                    if newValue && !selectedCategory.isFamilyFriendly {
                        withAnimation {
                            selectedCategory = .casual
                            currentQuestion = "Select a category and tap Truth"
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

// Custom button style for press animation
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
