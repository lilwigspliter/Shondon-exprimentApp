import SwiftUI

struct CountdownView: View {
    let countdownTime: TimeInterval = 3600 // Set your desired countdown time in seconds
    @State private var remainingTime: TimeInterval = 0
    @State private var isCountdownComplete = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(timeString(from: remainingTime))
                .font(.system(size: 48))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .foregroundColor(.white)
        .onAppear {
            remainingTime = countdownTime
        }
        .onReceive(timer) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer.upstream.connect().cancel()
                isCountdownComplete = true
                
                // Perform actions when the countdown is complete (e.g., post picture/video)
                postPictureOrVideo()
            }
        }
    }
    
    func timeString(from time: TimeInterval) -> String {
        let days = Int(time) / (60 * 60 * 24)
        let hours = (Int(time) / (60 * 60)) % 24
        let minutes = (Int(time) / 60) % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
    }
    
    func postPictureOrVideo() {
        // Implement your logic for posting the picture or video
        // This method will be called when the countdown timer reaches zero
    }
}

