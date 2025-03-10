import Foundation

/// Represents different categories of questions in the app
enum QuestionCategory: String, CaseIterable, Identifiable {
    case casual = "Casual"
    case deep = "Deep"
    case spicy = "Spicy"
    case funny = "Funny"
    case drinking = "Drinking"
    case neverHaveI = "Never Have I"
    case campusLife = "Campus Life"
    case partyDares = "Party Dares"
    
    var id: String { rawValue }
    
    /// Determines if the category is appropriate for family-friendly mode
    var isFamilyFriendly: Bool {
        switch self {
        case .casual, .funny, .campusLife:
            return true
        case .deep, .spicy, .drinking, .neverHaveI, .partyDares:
            return false
        }
    }
    
    /// Returns all questions for this category
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
        case .drinking:
            return [
                "Take a drink if you've ever skipped a lecture because you were hungover",
                "What's your go-to drunk food after a night out?",
                "Describe your worst hangover experience",
                "What's the most embarrassing thing you've done while drunk?",
                "Take a drink if you've ever lost something important during a night out",
                "What's the strangest place you've woken up after partying?",
                "What's your signature drink and how did it become your favorite?",
                "Take a drink if you've ever sent a regrettable text while drunk",
                "Share your best drinking game and everyone takes a sip",
                "What's the most ridiculous drunk purchase you've ever made?",
                "Take a drink if you've ever been kicked out of a bar or club",
                "What drinking skill are you most proud of?",
                "Describe the most legendary night out you've had at university",
                "Take a drink if you've ever had to be carried home by friends",
                "What's the worst alcohol combination you've experienced?",
                "What drinking game always leads to disaster for you?",
                "Take a drink if you've ever broken something while drunk",
                "Share your best strategy for avoiding a hangover",
                "What's your pre-game ritual before a big night out?",
                "Take a drink if you've ever borrowed someone's ID to get into a club",
                "What's the most outrageous bar or club promotion you've taken advantage of?",
                "Take a drink if you've ever mixed alcohol with energy drinks",
                "What's the weirdest drinking tradition at your university?",
                "Share your drunk food order that disgusts your friends",
                "Take a drink if you've ever forgotten how you got home"
            ]
            
        case .neverHaveI:
            return [
                "Never have I ever slept through a final exam",
                "Never have I ever submitted an assignment minutes before the deadline",
                "Never have I ever had a crush on a professor",
                "Never have I ever pretended to understand the lecture when I was completely lost",
                "Never have I ever stolen a roommate's food",
                "Never have I ever pulled an all-nighter for an exam",
                "Never have I ever skipped class to binge-watch a show",
                "Never have I ever attended class still drunk from the night before",
                "Never have I ever been caught cheating on a test",
                "Never have I ever dated someone from my class",
                "Never have I ever ghosted someone from university",
                "Never have I ever been to a house party that got shut down",
                "Never have I ever hooked up with someone in the library",
                "Never have I ever been on academic probation",
                "Never have I ever tried to flirt my way to a better grade",
                "Never have I ever fallen asleep in the library",
                "Never have I ever lied to a professor about why my assignment was late",
                "Never have I ever regretted my degree choice",
                "Never have I ever shown up to the wrong class and stayed anyway",
                "Never have I ever experienced terrible roommate drama",
                "Never have I ever drunk dialed or texted an ex during a night out",
                "Never have I ever changed my major because of a specific professor",
                "Never have I ever forgotten someone's name after hooking up",
                "Never have I ever been kicked out of student housing",
                "Never have I ever had a wardrobe malfunction at a party"
            ]
            
        case .campusLife:
            return [
                "What's the weirdest campus tradition at your university?",
                "Who's your favorite or most memorable professor and why?",
                "What's one university-specific life hack you've discovered?",
                "Describe your most memorable freshman/first-year experience",
                "What's the strangest place on campus you've fallen asleep?",
                "What's the most unusual club or society at your university?",
                "Share your best money-saving tip as a student",
                "What's the biggest mistake you made during your first year?",
                "What's your strategy for dealing with difficult group project members?",
                "What's your favorite campus study spot that few people know about?",
                "What's your most creative way of sneaking food into the library?",
                "What's the most useful thing you've learned outside of class?",
                "Share your worst roommate story",
                "What's your most embarrassing moment in a lecture?",
                "What campus food do you love that everyone else hates?",
                "What's the weirdest thing you've seen happen in a dorm?",
                "What's the most inventive way you've prepared food with minimal resources?",
                "What's the strangest course offered at your university?",
                "What's the most stressful deadline you've ever faced?",
                "What's the most outrageous student discount you've taken advantage of?",
                "What's your favorite campus event of the year?",
                "What's the worst on-campus job you've had?",
                "What's something about your university that the prospectus doesn't tell you?",
                "What's the best way to get a professor to like you?",
                "What's a unique feature of your university that you're proud of?"
            ]
            
        case .partyDares:
            return [
                "Dare: Text your crush the last emoji you used and nothing else",
                "Dare: Let someone else post a status on your social media",
                "Dare: Call a friend not at the party and sing them your favorite song",
                "Dare: Show everyone your most embarrassing photo",
                "Dare: Do your best impression of someone in the room",
                "Dare: Let the group go through your phone for 1 minute",
                "Dare: Share your screen time report with everyone",
                "Dare: Exchange an item of clothing with someone until the next round",
                "Dare: Let someone draw on your face with a marker",
                "Dare: Send a voice message to someone saying 'I know what you did'",
                "Dare: Do 20 jumping jacks right now",
                "Dare: Let the group create a new dating profile for you",
                "Dare: Speak in an accent for the next 10 minutes",
                "Dare: Text your parents asking for a weird piece of advice",
                "Dare: Try to sell a random object to the group for one minute",
                "Dare: Let someone look through your search history",
                "Dare: Post the oldest selfie on your phone to your story",
                "Dare: Give a two-minute lecture on a topic the group chooses",
                "Dare: Let the group pick your profile picture for a week",
                "Dare: Send a message to three people saying 'We need to talk...'",
                "Dare: Let someone send a text from your phone to anyone they choose",
                "Dare: Reveal your screen time for your most-used app",
                "Dare: Switch clothes with the person to your right for the next round",
                "Dare: Show everyone your saved posts on Instagram",
                "Dare: Let everyone see the last five people you texted and what about"
            ]
        }
    }
    
    /// Returns a random question from this category
    func randomQuestion() -> String {
        questions.randomElement() ?? "No question available"
    }
} 