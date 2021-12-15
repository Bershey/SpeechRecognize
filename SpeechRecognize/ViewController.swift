//
//  ViewController.swift
//  SpeechRecognize
//
//  Created by minmin on 2021/12/08.
//

import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController {

    // MARK: - Properties

    lazy var voiceOverlay: VoiceOverlayController = {
        let recordableHandler = {
            return SpeechController(locale: Locale(identifier: "ja_JP"))
        }
        return VoiceOverlayController(speechControllerHandler: recordableHandler)
    }()
    @IBOutlet weak var button: UIButton!
    // MARK: -  Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStopTimeout = 5
        voiceOverlay.start(on: self) { text, fin, _ in
            if fin {
                print("失敗\(text)")
            } else {
                print("\(text)")
            }
        } errorHandler: { error in
        }
    }
}

extension ViewController: VoiceOverlayDelegate{
    func recording(text: String?, final: Bool?, error: Error?) {

    }


}

