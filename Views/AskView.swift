import SwiftUI

struct AskView: View {
    @State private var question: String = ""
    @State private var searchResults: [Transcript] = []
    @State private var answer: String = ""
    
    var body: some View {
        VStack {
            Text("Ask a Question")
                .font(.title)
                .padding()
            
            TextField("Enter your question", text: $question)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                searchResults = searchTranscripts()
                answer = getAnswer()
            }) {
                Text("Search")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            if !searchResults.isEmpty {
                Text("Search Results")
                    .font(.title)
                    .padding()
                
                List(searchResults, id: \.id) { transcript in
                    VStack(alignment: .leading) {
                        Text(transcript.text)
                            .font(.headline)
                        
                        Text("App: \(transcript.app)")
                            .font(.subheadline)
                        
                        if let url = transcript.url {
                            Button(action: {
                                openURL(url)
                            }) {
                                Text("Open in Browser")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding()
                }
            }
            
            if !answer.isEmpty {
                Text("Answer")
                    .font(.title)
                    .padding()
                
                Text(answer)
                    .font(.headline)
                    .padding()
            }
        }
    }
    
    private func searchTranscripts() -> [Transcript] {
        // Implement transcript search logic here
        // Return the search results
        return []
    }
    
    private func getAnswer() -> String {
        // Implement OpenAI API logic here
        // Return the answer
        return ""
    }
    
    private func openURL(_ url: URL) {
        // Implement logic to open URL in browser
    }
}

