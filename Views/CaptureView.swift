import SwiftUI

struct CaptureView: View {
    @ObservedObject var captureManager: CaptureManager
    
    var body: some View {
        VStack {
            Text("Capture View")
                .font(.title)
                .padding()
            
            Button(action: {
                captureManager.startRecording()
            }) {
                Text("Start Recording")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                captureManager.stopRecording()
            }) {
                Text("Stop Recording")
                    .font(.headline)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView(captureManager: CaptureManager())
    }
}
