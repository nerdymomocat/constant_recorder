import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    
    private let fileManager = FileManager.default
    
    private init() {}
    
    func createDirectory(at url: URL) throws {
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }
    
    func saveRecording(_ recording: Recording, to directoryURL: URL) throws {
        let recordingURL = directoryURL.appendingPathComponent("\(recording.id.uuidString).json")
        let data = try JSONEncoder().encode(recording)
        try data.write(to: recordingURL)
    }
    
    func loadRecording(from url: URL) throws -> Recording {
        let data = try Data(contentsOf: url)
        let recording = try JSONDecoder().decode(Recording.self, from: data)
        return recording
    }
    
    func deleteRecording(at url: URL) throws {
        try fileManager.removeItem(at: url)
    }
    
    func getDirectoryContents(at url: URL) throws -> [URL] {
        let contents = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        return contents
    }
}
