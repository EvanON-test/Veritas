import SwiftUI

/// View component for the family-friendly mode toggle
struct FamilyModeToggleView: View {
    @ObservedObject var viewModel: QuestionViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(EmojiTheme.familyMode)
                    .font(.title3)
                    .padding(.leading, 40)
                
                Toggle(isOn: Binding(
                    get: { viewModel.isFamilyFriendlyMode },
                    set: { viewModel.setFamilyFriendlyMode($0) }
                ).animation()) {
                    Text("Family-Friendly Mode")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(ColorTheme.textPrimary)
                }
                .toggleStyle(SwitchToggleStyle(tint: ColorTheme.accent))
                .padding(.trailing, 40)
            }
            
            Text(viewModel.isFamilyFriendlyMode ? "Adult content hidden" : "All content visible")
                .font(.caption)
                .foregroundColor(ColorTheme.textSecondary)
                .padding(.bottom, 4)
        }
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(ColorTheme.cardBackground)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 30)
    }
} 