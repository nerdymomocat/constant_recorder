import SwiftUI

struct ChatboxView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var body: some View {
        VStack {
            Text("Ask a question:")
                .font(.headline)
                .padding()
            
            TextField("Enter your question", text: $question)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                askQuestion()
            }) {
                Text("Ask")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Text("Answer:")
                .font(.headline)
                .padding()
            
            Text(answer)
                .padding()
        }
    }
    
    func askQuestion() {
        // Search for relevant content based on app/related url, date or time reference, and search terms
        let relevantContent = ChatboxSearchHelper.searchRelevantContent(app: "App Name", url: URL(string: "https://example.com"), date: Date(), searchTerms: question)
        
        // Send relevant content to OpenAI API and get the answer
        answer = ChatboxOpenAIHelper.getAnswer(content: relevantContent)
    }
}

struct ChatboxView_Previews: PreviewProvider {
    static var previews: some View {
        ChatboxView()
    }
}
