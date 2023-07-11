import Foundation

class ChatboxSearchHelper {
    static func searchOccurrences(content: String, app: String?, url: URL?, date: Date?, time: String?, searchTerms: [String]) -> [Recording] {
        var occurrences: [Recording] = []
        
        // Search for occurrences based on app, URL, date, time, and search terms
        
        return occurrences
    }
    
    static func sendContentToOpenAI(content: String) -> String {
        let response = OpenAIHelper.sendRequest(content: content)
        return response
    }
}

