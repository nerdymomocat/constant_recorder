import AVFoundation
import Vision

class OCRHelper {
    
    private var textRecognitionRequest: VNRecognizeTextRequest?
    
    init() {
        setupTextRecognitionRequest()
    }
    
    private func setupTextRecognitionRequest() {
        textRecognitionRequest = VNRecognizeTextRequest(completionHandler: handleTextRecognitionResult)
        textRecognitionRequest?.recognitionLevel = .accurate
        textRecognitionRequest?.usesLanguageCorrection = true
    }
    
    private func handleTextRecognitionResult(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNRecognizedTextObservation] else {
            return
        }
        
        let recognizedText = observations.compactMap { observation in
            return observation.topCandidates(1).first?.string
        }.joined(separator: " ")
        
        // Process the recognized text
        
        // ...
    }
    
    func performOCR(on image: CGImage) {
        let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
        
        do {
            try requestHandler.perform([textRecognitionRequest!])
        } catch {
            print("Error performing OCR: \(error)")
        }
    }
}
