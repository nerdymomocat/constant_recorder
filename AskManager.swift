import Foundation

class AskManager {
    
    private let searchHelper: SearchHelper
    private let openAIHelper: OpenAIHelper
    
    init() {
        searchHelper = SearchHelper()
        openAIHelper = OpenAIHelper()
    }
    
    func askQuestion(_ question: String) {
        let searchResults = searchHelper.searchContent(question)
        let relevantContent = getRelevantContent(searchResults)
        let answer = openAIHelper.answerQuestion(question, relevantContent)
        displayAnswer(answer)
    }
    
    private func getRelevantContent(_ searchResults: [SearchResult]) -> [String] {
        var relevantContent: [String] = []
        for result in searchResults {
            let content = getContentForResult(result)
            relevantContent.append(content)
        }
        return relevantContent
    }
    
    private func getContentForResult(_ result: SearchResult) -> String {
        // Logic to retrieve content based on result
        return ""
    }
    
    private func displayAnswer(_ answer: String) {
        // Logic to display answer to user
    }
}
