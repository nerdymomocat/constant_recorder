import Foundation

struct ExportTextHelper {
    
    static func exportText(for recording: Recording) -> String {
        var exportText = ""
        
        // Add recording details
        exportText += "Recording ID: \(recording.id.uuidString)\n"
        exportText += "Timestamp: \(recording.timestamp)\n"
        exportText += "Video URL: \(recording.videoURL.absoluteString)\n"
        if let audioURL = recording.audioURL {
            exportText += "Audio URL: \(audioURL.absoluteString)\n"
        }
        exportText += "\n"
        
        // Add transcript details
        exportText += "Transcript:\n"
        exportText += "ID: \(recording.transcript.id.uuidString)\n"
        exportText += "Text: \(recording.transcript.text)\n"
        exportText += "Timestamp: \(recording.transcript.timestamp)\n"
        exportText += "App: \(recording.transcript.app)\n"
        if let url = recording.transcript.url {
            exportText += "URL: \(url.absoluteString)\n"
        }
        exportText += "\n"
        
        // Add OCR result details
        exportText += "OCR Result:\n"
        exportText += "ID: \(recording.ocrResult.id.uuidString)\n"
        exportText += "Timestamp: \(recording.ocrResult.timestamp)\n"
        exportText += "Text: \(recording.ocrResult.text)\n"
        
        return exportText
    }
    
}
