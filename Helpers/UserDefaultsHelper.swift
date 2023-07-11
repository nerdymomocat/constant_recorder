import Foundation

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    private let recordingKey = "Recording"
    
    func saveRecording(_ recording: Recording) {
        var recordings = loadRecordings()
        recordings.append(recording)
        
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(recordings) {
            UserDefaults.standard.set(encodedData, forKey: recordingKey)
        }
    }
    
    func loadRecordings() -> [Recording] {
        if let data = UserDefaults.standard.data(forKey: recordingKey) {
            let decoder = JSONDecoder()
            if let recordings = try? decoder.decode([Recording].self, from: data) {
                return recordings
            }
        }
        return []
    }
    
    func deleteRecording(_ recording: Recording) {
        var recordings = loadRecordings()
        if let index = recordings.firstIndex(where: { $0.id == recording.id }) {
            recordings.remove(at: index)
            
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(recordings) {
                UserDefaults.standard.set(encodedData, forKey: recordingKey)
            }
        }
    }
    
    func updateRecording(_ recording: Recording) {
        var recordings = loadRecordings()
        if let index = recordings.firstIndex(where: { $0.id == recording.id }) {
            recordings[index] = recording
            
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(recordings) {
                UserDefaults.standard.set(encodedData, forKey: recordingKey)
            }
        }
    }
}

