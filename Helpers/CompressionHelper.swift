import AVFoundation

class CompressionHelper {
    
    static func compressVideo(inputURL: URL, outputURL: URL, completion: @escaping (URL?, Error?) -> Void) {
        let asset = AVAsset(url: inputURL)
        guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetLowQuality) else {
            completion(nil, NSError(domain: "CompressionHelper", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create AVAssetExportSession"]))
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
                completion(nil, NSError(domain: "CompressionHelper", code: 0, userInfo: [NSLocalizedDescriptionKey: "Compression cancelled"]))
            default:
                completion(nil, NSError(domain: "CompressionHelper", code: 0, userInfo: [NSLocalizedDescriptionKey: "Compression failed"]))
            }
        }
    }
    
}
