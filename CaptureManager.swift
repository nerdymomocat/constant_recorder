import AVFoundation
import Vision

class CaptureManager {
    
    private var captureSession: AVCaptureSession?
    private var videoOutput: AVCaptureVideoDataOutput?
    private var audioOutput: AVCaptureAudioDataOutput?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    private var ocrHelper: OCRHelper?
    private var transcriptionHelper: TranscriptionHelper?
    
    private var isRecording: Bool = false
    
    init() {
        setupCaptureSession()
        setupVideoOutput()
        setupAudioOutput()
        setupPreviewLayer()
        setupOCRHelper()
        setupTranscriptionHelper()
    }
    
    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let captureSession = captureSession else {
            return
        }
        
        captureSession.beginConfiguration()
        
        // Set the capture session quality
        captureSession.sessionPreset = .high
        
        // Set the input device
        guard let inputDevice = AVCaptureScreenInput(displayID: CGMainDisplayID()) else {
            return
        }
        
        if captureSession.canAddInput(inputDevice) {
            captureSession.addInput(inputDevice)
        }
        
        captureSession.commitConfiguration()
    }
    
    private func setupVideoOutput() {
        videoOutput = AVCaptureVideoDataOutput()
        
        guard let captureSession = captureSession, let videoOutput = videoOutput else {
            return
        }
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
        
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoOutputQueue"))
    }
    
    private func setupAudioOutput() {
        audioOutput = AVCaptureAudioDataOutput()
        
        guard let captureSession = captureSession, let audioOutput = audioOutput else {
            return
        }
        
        if captureSession.canAddOutput(audioOutput) {
            captureSession.addOutput(audioOutput)
        }
        
        audioOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "audioOutputQueue"))
    }
    
    private func setupPreviewLayer() {
        guard let captureSession = captureSession else {
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill
    }
    
    private func setupOCRHelper() {
        ocrHelper = OCRHelper()
    }
    
    private func setupTranscriptionHelper() {
        transcriptionHelper = TranscriptionHelper()
    }
    
    func startCapture() {
        guard let captureSession = captureSession else {
            return
        }
        
        if !captureSession.isRunning {
            captureSession.startRunning()
        }
        
        isRecording = true
    }
    
    func stopCapture() {
        guard let captureSession = captureSession else {
            return
        }
        
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
        
        isRecording = false
    }
    
    func toggleCapture() {
        if isRecording {
            stopCapture()
        } else {
            startCapture()
        }
    }
    
    func toggleMicCapture() {
        // Toggle mic capture logic
    }
    
    func toggleSpeakerCapture() {
        // Toggle speaker capture logic
    }
    
    func starMoment() {
        // Star moment logic
    }
    
    func compressVideo() {
        // Video compression logic
    }
}

extension CaptureManager: AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if output == videoOutput {
            // Video capture logic
        } else if output == audioOutput {
            // Audio capture logic
        }
    }
}
