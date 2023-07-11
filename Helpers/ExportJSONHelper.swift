import Foundation

class ExportJSONHelper {
    
    static func exportJSON(for recording: Recording) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(recording)
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            print("Error encoding recording to JSON: \(error)")
            return nil
        }
    }
    
    static func importJSON(from jsonString: String) -> Recording? {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Invalid JSON string")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            let recording = try decoder.decode(Recording.self, from: jsonData)
            return recording
        } catch {
            print("Error decoding JSON to recording: \(error)")
            return nil
        }
    }
    
}

