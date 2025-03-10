import Foundation

/// Provides emoji assets for the Veritas app
struct EmojiTheme {
    // Category emojis
    static let casual = "☕️" // Coffee for casual conversation
    static let deep = "🌌" // Galaxy for deep thoughts
    static let spicy = "🌶️" // Hot pepper for spicy questions
    static let funny = "😂" // Laughing face for funny
    static let drinking = "🍻" // Beer mugs for drinking
    static let neverHaveI = "🙅‍♂️" // Person with arms crossed for "never have I"
    static let campusLife = "🎓" // Graduation cap for campus life
    static let partyDares = "🎯" // Dartboard for party dares
    
    // Button emojis
    static let truth = "✨" // Sparkles for truth
    static let familyMode = "👨‍👩‍👧‍👦" // Family for family mode
    
    // Action emojis
    static let shuffle = "🔀" // Shuffle
    static let next = "➡️" // Next arrow
    
    // Returns emoji for a specific category
    static func emojiFor(category: QuestionCategory) -> String {
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
    
    // Returns random reaction emoji appropriate for the category
    static func randomReactionFor(category: QuestionCategory) -> String {
        switch category {
        case .casual:
            return ["👍", "👋", "🙌", "👏", "🤝", "💭", "💬", "🗣️", "🧠", "💫"].randomElement()!
        case .deep:
            return ["🤔", "🧐", "💭", "🧠", "💫", "🌟", "✨", "🌈", "🌊", "🔮"].randomElement()!
        case .spicy:
            return ["👀", "🔥", "💥", "❤️‍🔥", "💋", "😏", "🤫", "😈", "🙊", "💘"].randomElement()!
        case .funny:
            return ["😂", "🤣", "😆", "😝", "🤪", "😹", "🎭", "🎪", "🎯", "🎮"].randomElement()!
        case .drinking:
            return ["🍻", "🥂", "🍷", "🍸", "🍹", "🍾", "🥴", "🤪", "🎉", "🎊"].randomElement()!
        case .neverHaveI:
            return ["🙅‍♂️", "😱", "😮", "🤫", "🤐", "🤭", "👀", "🙊", "💯", "🍿"].randomElement()!
        case .campusLife:
            return ["🎓", "📚", "🏫", "💻", "🔬", "📝", "👩‍🎓", "👨‍🎓", "🧠", "📱"].randomElement()!
        case .partyDares:
            return ["🎯", "😈", "🤪", "🔥", "🎮", "🎪", "🎭", "🥳", "🎬", "🤹‍♂️"].randomElement()!
        }
    }
} 