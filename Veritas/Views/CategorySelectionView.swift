import SwiftUI

/// View component for the category selection horizontal scrollview
struct CategorySelectionView: View {
    @ObservedObject var viewModel: QuestionViewModel
    let onCategorySelected: (QuestionCategory) -> Void
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    // Add leading spacer for centering
                    Spacer(minLength: 0)
                    
                    ForEach(viewModel.availableCategories) { category in
                        Button(action: {
                            onCategorySelected(category)
                            
                            // Scroll to the selected category
                            withAnimation {
                                scrollView.scrollTo(category, anchor: .center)
                            }
                            
                            // Add haptic feedback for category selection
                            let impact = UIImpactFeedbackGenerator(style: .light)
                            impact.impactOccurred()
                        }) {
                            HStack(spacing: 6) {
                                Text(EmojiTheme.emojiFor(category: category))
                                    .font(.system(size: 18))
                                
                                Text(category.rawValue)
                            }
                        }
                        .buttonStyle(CategoryButtonStyle(isSelected: viewModel.selectedCategory == category, category: category))
                        .id(category)
                        .contentShape(Rectangle())
                    }
                    
                    // Add trailing spacer for centering
                    Spacer(minLength: 0)
                }
            }
            .onAppear {
                // Scroll to initial category
                scrollView.scrollTo(viewModel.selectedCategory, anchor: .center)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(ColorTheme.background)
    }
} 