import Foundation
import SwiftUI
import Combine

/// ViewModel for the Question screen that manages question selection and family-friendly mode
class QuestionViewModel: ObservableObject {
    // Published properties to notify views of changes
    @Published var currentQuestion: String = "Select a category and tap Truth"
    @Published var selectedCategory: QuestionCategory = .casual
    @Published var isFamilyFriendlyMode: Bool = false
    
    // Computed property to filter categories based on family-friendly mode
    var availableCategories: [QuestionCategory] {
        if isFamilyFriendlyMode {
            return QuestionCategory.allCases.filter { $0.isFamilyFriendly }
        } else {
            return QuestionCategory.allCases
        }
    }
    
    // MARK: - Public Methods
    
    /// Selects a new question category
    /// - Parameter category: The category to select
    func selectCategory(_ category: QuestionCategory) {
        // If in family-friendly mode and trying to select a non-family-friendly category, ignore
        if isFamilyFriendlyMode && !category.isFamilyFriendly {
            return
        }
        selectedCategory = category
    }
    
    /// Generates a new random question from the selected category
    func generateRandomQuestion() {
        currentQuestion = selectedCategory.randomQuestion()
    }
    
    /// Toggles family-friendly mode
    /// - Parameter isEnabled: Whether family-friendly mode should be enabled
    func setFamilyFriendlyMode(_ isEnabled: Bool) {
        isFamilyFriendlyMode = isEnabled
        
        // If enabling family-friendly mode and current category isn't family-friendly,
        // switch to a family-friendly category
        if isEnabled && !selectedCategory.isFamilyFriendly {
            selectedCategory = .casual
            currentQuestion = "Select a category and tap Truth"
        }
    }
} 