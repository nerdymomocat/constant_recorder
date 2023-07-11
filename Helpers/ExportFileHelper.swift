import Foundation

class ExportFileHelper {
    static func exportRecording(_ recording: Recording, from startTimestamp: Date, to endTimestamp: Date) {
        let exportURL = FileManager.default.temporaryDirectory.appendingPathComponent("export.mp4")
        
        let composition = AVMutableComposition()
        
        guard let videoAsset = AVAsset(url: recording.videoURL) as? AVURLAsset else {
            print("Failed to load video asset")
            return
        }
        
        let videoTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        do {
            try videoTrack?.insertTimeRange(CMTimeRange(start: startTimestamp, end: endTimestamp), of: videoAsset.tracks(withMediaType: .video)[0], at: .zero)
        } catch {
            print("Failed to insert video track")
            return
        }
        
        if let audioURL = recording.audioURL {
            guard let audioAsset = AVAsset(url: audioURL) as? AVURLAsset else {
                print("Failed to load audio asset")
                return
            }
            
            let audioTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
            do {
                try audioTrack?.insertTimeRange(CMTimeRange(start: startTimestamp, end: endTimestamp), of: audioAsset.tracks(withMediaType: .audio)[0], at: .zero)
            } catch {
                print("Failed to insert audio track")
                return
            }
        }
        
        guard let exportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetPassthrough) else {
            print("Failed to create export session")
            return
        }
        
        exportSession.outputURL = exportURL
        exportSession.outputFileType = .mp4
        
        exportSession.exportAsynchronously {
            switch exportSession.status {
            case .completed:
                print("Export completed")
                // Do something with the exported file
            case .failed:
                print("Export failed")
            case .cancelled:
                print("Export cancelled")
            default:
                break
            }
        }
    }
}
