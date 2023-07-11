import AVFoundation

class ExportMP4Helper {
    
    static func exportMP4(from recording: Recording, startTime: TimeInterval, endTime: TimeInterval, completion: @escaping (URL?, Error?) -> Void) {
        let composition = AVMutableComposition()
        
        guard let videoAsset = AVAsset(url: recording.videoURL).mutableCopy() as? AVMutableCompositionTrack else {
            completion(nil, ExportError.videoAssetCreationFailed)
            return
        }
        
        let audioAsset = recording.audioURL != nil ? AVAsset(url: recording.audioURL!) : nil
        
        let videoCompositionTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        let audioCompositionTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        do {
            try videoCompositionTrack?.insertTimeRange(CMTimeRange(start: CMTime(seconds: startTime, preferredTimescale: 600), end: CMTime(seconds: endTime, preferredTimescale: 600)), of: videoAsset, at: .zero)
            
            if let audioAsset = audioAsset {
                try audioCompositionTrack?.insertTimeRange(CMTimeRange(start: CMTime(seconds: startTime, preferredTimescale: 600), end: CMTime(seconds: endTime, preferredTimescale: 600)), of: audioAsset, at: .zero)
            }
        } catch {
            completion(nil, ExportError.trackInsertionFailed)
            return
        }
        
        guard let exportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetPassthrough) else {
            completion(nil, ExportError.exportSessionCreationFailed)
            return
        }
        
        let exportURL = FileManager.default.temporaryDirectory.appendingPathComponent("exportedVideo.mp4")
        exportSession.outputURL = exportURL
        exportSession.outputFileType = .mp4
        
        exportSession.exportAsynchronously {
            switch exportSession.status {
            case .completed:
                completion(exportURL, nil)
            case .failed, .cancelled:
                completion(nil, exportSession.error)
            default:
                completion(nil, ExportError.exportFailed)
            }
        }
    }
    
}

enum ExportError: Error {
    case videoAssetCreationFailed
    case trackInsertionFailed
    case exportSessionCreationFailed
    case exportFailed
}
