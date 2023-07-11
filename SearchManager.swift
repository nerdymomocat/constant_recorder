import Foundation

class SearchManager {
    
    private var recordings: [Recording] = []
    
    func addRecording(_ recording: Recording) {
        recordings.append(recording)
    }
    
    func scrollTimeline(to timestamp: TimeInterval) {
        // Code to scroll through the timeline
    }
    
    func searchContent(_ term: String) -> [Recording] {
        var searchResults: [Recording] = []
        
        for recording in recordings {
            if recording.transcript.contains(term) || recording.ocrResult.contains(term) {
                searchResults.append(recording)
            }
        }
        
        return searchResults
    }
    
    func openInBrowser(_ recording: Recording) {
        if let url = recording.url {
            // Code to open the URL in a browser
        }
    }
}
