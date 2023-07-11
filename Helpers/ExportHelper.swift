import Foundation
import AVFoundation

class ExportHelper {
    
    static func exportRecording(startTimestamp: Date, endTimestamp: Date, recording: Recording, ocrResults: [OCRResult], transcription: String, micRecording: Data?, speakerRecording: Data?) {
        guard let exportURL = FileManagerHelper.createExportURL() else {
            return
        }
        
        let exportSession = AVAssetExportSession(asset: recording.asset, presetName: AVAssetExportPresetPassthrough)
        exportSession?.outputURL = exportURL
        exportSession?.outputFileType = .mp4
        
        let timeRange = CMTimeRangeFromTimeToTime(start: CMTime(seconds: startTimestamp.timeIntervalSince1970), end: CMTime(seconds: endTimestamp.timeIntervalSince1970))
        exportSession?.timeRange = timeRange
        
        exportSession?.exportAsynchronously(completionHandler: {
            switch exportSession?.status {
            case .completed:
                let exportURL = exportSession?.outputURL
                let exportText = ExportTextHelper.createExportText(startTimestamp: startTimestamp, endTimestamp: endTimestamp, ocrResults: ocrResults, transcription: transcription)
                let exportJSON = ExportJSONHelper.createExportJSON(startTimestamp: startTimestamp, endTimestamp: endTimestamp, ocrResults: ocrResults, transcription: transcription)
                
                ExportFileHelper.saveExportFile(exportURL: exportURL, exportText: exportText, exportJSON: exportJSON)
                
                if let micRecording = micRecording {
                    ExportFileHelper.saveMicRecording(micRecording: micRecording)
                }
                
                if let speakerRecording = speakerRecording {
                    ExportFileHelper.saveSpeakerRecording(speakerRecording: speakerRecording)
                }
                
                NotificationHelper.showExportNotification()
                
            case .failed:
                print("Export failed: \(exportSession?.error?.localizedDescription ?? "")")
                
            case .cancelled:
                print("Export cancelled")
                
            default:
                break
            }
        })
    }
}
