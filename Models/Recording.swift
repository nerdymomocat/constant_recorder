import Foundation

struct Recording {
    var id: UUID
    var timestamp: Date
    var videoURL: URL
    var audioURL: URL?
    var transcript: Transcript
    var ocrResult: OCRResult
    var isFavorite: Bool
}

