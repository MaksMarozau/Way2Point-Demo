import UIKit
import AVFoundation

final class SoundsManager {
    
    static let instance = SoundsManager()
    private init() { }
    
    private var player = AVAudioPlayer()
    
    func basicSound(by tag: String) {
        if UserDefaultsManager.instance.isSound {
            DispatchQueue.global().async {
                guard let path = Bundle.main.url(forResource: tag, withExtension: "mp3") else { return }
                self.player.stop()
                self.player = try! AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
                self.player.currentTime = 0
                self.player.play()
            }
        } else {
            player.stop()
        }
    }
}
