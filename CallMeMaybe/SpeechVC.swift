//
//  SpeechVC.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

import SpeechToTextV1
import ToneAnalyzerV3

class SpeechVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var speechTextArea: UITextView!
    
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var analyzeButton: UIButton!
    
    var emotionalTones = [EmotionalToneReport!]()
    var socialTones = [SocialToneReport!]()
    var fiveTones = [FiveEmotionsReport!]()
    
    let speechToText = SpeechToText(username: speechToTextUsername, password: speechToTextPassword)
    let toneAnalyzer = ToneAnalyzer(username: toneAnalyzerUsername, password: toneAnalyzerPassword, version: toneAnalyzerDate)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        speechTextArea.delegate = self
        speechTextArea.returnKeyType = .done
        
        self.hideKeyboardWhenTappedAround()
        
        
    }

    @IBAction func speechButton(_ sender: UIButton) {
        speechButton.isEnabled = false
        analyzeButton.isEnabled = false
        stopButton.isEnabled = true
        startStreaming()
        
    }
    @IBAction func stopButton(_ sender: UIButton) {
        speechButton.isEnabled = true
        analyzeButton.isEnabled = true
        stopButton.isEnabled = false
        stopStreaming()
    }
    
    @IBAction func analyzeButton(_ sender: UIButton) {
        
        toneAnalyzer.getTone(ofText: speechTextArea.text!, failure : failure){
            tones in
            
            let emotions = tones.documentTone[0].tones
            
            for i in 0..<emotions.count{
                let emo = EmotionalToneReport(emotionId: emotions[i].id, emotionName: emotions[i].name, emotionScore: Float(emotions[i].score))
                self.emotionalTones.append(emo)
            }
            
            let socials = tones.documentTone[1].tones
            
            for i in 0..<socials.count{
                let soc = SocialToneReport(socialId: socials[i].id, socialName: socials[i].name, socialScore: Float(socials[i].score))
                self.socialTones.append(soc)
            }
            
            let five = tones.documentTone[2].tones
            
            for i in 0..<five.count{
                let fiv = FiveEmotionsReport(fiveId: five[i].id, fiveName: five[i].name, fiveScore: Float(five[i].score))
                self.fiveTones.append(fiv)
            }
            
            let reports = [self.emotionalTones, self.socialTones, self.fiveTones] as [Any]
            
            self.performSegue(withIdentifier: "toReport", sender: reports)
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReportVC {
            if let report = sender as? Array<Any>{
                destination.getEmotionReportInformation = report[0] as! [EmotionalToneReport]
                destination.getSocialReportInformation = report[1] as! [SocialToneReport]
                destination.getFiveReportInformation = report[2] as! [FiveEmotionsReport]
            }
        }
    }
    
    func startStreaming() {
        var settings = RecognitionSettings(contentType: .opus)
        settings.continuous = true
        settings.interimResults = true
        let failure = { (error: Error) in print(error) }
        speechToText.recognizeMicrophone(settings: settings, failure: failure) { results in
            
            self.speechTextArea.text = results.bestTranscript
            
            /* TO-DO : AUTO SCROLL DOWN! */
//            print("X is : \(self.speechTextArea.frame.origin.x)\n Y is : \(self.speechTextArea.frame.origin.y)")
//            
//            let startPosition = self.speechTextArea.beginningOfDocument
//            let endPosition = self.speechTextArea.endOfDocument
//            
//            let cursorPosition = self.speechTextArea.offset(from: startPosition, to: endPosition)
//            
//            if cursorPosition > 70 {
//                self.speechTextArea.contentOffset.y = CGFloat(cursorPosition)
//            }
//            
            /*                  */
            
        }
    }
    
    func stopStreaming() {
        speechToText.stopRecognizeMicrophone()
    }
    
}
