import AVFoundation

class MP4Helper {
    
    static func compressVideo(inputURL: URL, outputURL: URL, completion: @escaping (URL?, Error?) -> Void) {
        let asset = AVURLAsset(url: inputURL)
        guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetPassthrough) else {
            completion(nil, NSError(domain: "MP4Helper", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create AVAssetExportSession"]))
            return
        }
        
        exportSession.outputURL = outputURL
        exportSession.outputFileType = .mp4
        exportSession.shouldOptimizeForNetworkUse = true
        
        exportSession.exportAsynchronously {
            switch exportSession.status {
            case .completed:
                completion(outputURL, nil)
            case .failed:
                completion(nil, exportSession.error)
            case .cancelled:
                completion(nil, NSError(domain: "MP4Helper", code: 0, userInfo: [NSLocalizedDescriptionKey: "Export session cancelled"]))
            default:
                completion(nil, NSError(domain: "MP4Helper", code: 0, userInfo: [NSLocalizedDescriptionKey: "Export session failed with unknown status"]))
            }
        }
    }
    
}
