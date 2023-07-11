import Foundation
import AVFoundation

class ExportManager {
    
    private let fileManagerHelper: FileManagerHelper
    private let exportValidationHelper: ExportValidationHelper
    private let exportTimestampHelper: ExportTimestampHelper
    private let exportFileHelper: ExportFileHelper
    private let exportTextHelper: ExportTextHelper
    private let exportJSONHelper: ExportJSONHelper
    private let exportMP4Helper: ExportMP4Helper
    
    init() {
        fileManagerHelper = FileManagerHelper()
        exportValidationHelper = ExportValidationHelper()
        exportTimestampHelper = ExportTimestampHelper()
        exportFileHelper = ExportFileHelper()
        exportTextHelper = ExportTextHelper()
        exportJSONHelper = ExportJSONHelper()
        exportMP4Helper = ExportMP4Helper()
    }
    
    func exportRecording(startTimestamp: Double, endTimestamp: Double) {
        guard let recording = CaptureManager.shared.getRecording() else {
            print("No recording available")
            return
        }
        
        guard let transcript = recording.transcript else {
            print("No transcript available")
            return
        }
        
        guard let ocrResult = recording.ocrResult else {
            print("No OCR result available")
            return
        }
        
        let filteredTranscript = exportValidationHelper.filterTranscript(transcript: transcript, startTimestamp: startTimestamp, endTimestamp: endTimestamp)
        let filteredOCRResult = exportValidationHelper.filterOCRResult(ocrResult: ocrResult, startTimestamp: startTimestamp, endTimestamp: endTimestamp)
        
        let exportTimestamp = exportTimestampHelper.generateExportTimestamp()
        
        let exportFolderURL = fileManagerHelper.createExportFolder(exportTimestamp: exportTimestamp)
        
        let textFilePath = exportFileHelper.createTextFile(exportFolderURL: exportFolderURL)
        exportTextHelper.exportText(transcript: filteredTranscript, ocrResult: filteredOCRResult, textFilePath: textFilePath)
        
        let jsonFilePath = exportFileHelper.createJSONFile(exportFolderURL: exportFolderURL)
        exportJSONHelper.exportJSON(transcript: filteredTranscript, ocrResult: filteredOCRResult, jsonFilePath: jsonFilePath)
        
        let mp4FilePath = exportFileHelper.createMP4File(exportFolderURL: exportFolderURL)
        exportMP4Helper.exportMP4(startTimestamp: startTimestamp, endTimestamp: endTimestamp, mp4FilePath: mp4FilePath)
    }
}
