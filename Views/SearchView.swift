import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    @State private var searchResults: [Recording] = []
    
    var body: some View {
        VStack {
            TextField("Search term", text: $searchTerm)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                searchResults = SearchManager.shared.searchContent(searchTerm)
            }) {
                Text("Search")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            List(searchResults, id: \.id) { recording in
                VStack(alignment: .leading) {
                    Text(recording.transcript.text)
                        .font(.headline)
                    Text(recording.transcript.app)
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
