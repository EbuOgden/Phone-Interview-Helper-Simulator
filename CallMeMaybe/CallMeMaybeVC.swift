//
//  CallMeMaybeVC.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit
import AVFoundation

import TextToSpeechV1

class CallMeMaybeVC: UIViewController {

    @IBOutlet weak var nameAndSurname: UILabel!
    @IBOutlet weak var departmentName: UILabel!
    
    @IBOutlet weak var callImage: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    var fullName: String!
    var userDepartmentName: String!
    
    let textToSpeech = TextToSpeech(username: textToSpeechUsername, password: textToSpeechPassword)
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let musicPath = Bundle.main.path(forResource: "PhoneCall", ofType: "wav")
        let musicURL = URL(fileURLWithPath: musicPath!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: musicURL)
            audioPlayer.play()
        } catch let err as NSError {
            print("Call Audio Error : \(err.debugDescription)")
        }

        for x in 0..<13 {
            images.append(UIImage(named: "tmp-\(x).png")!)
        }
        
        callImage.animationImages = images
        callImage.animationDuration = 1.0
        callImage.startAnimating()
        
        fullName = User.sharedInstance.fullName
        userDepartmentName = User.sharedInstance.departmentName

        nameAndSurname.text = fullName
        departmentName.text = userDepartmentName

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        textToSpeech.synthesize("Hello \(fullName!), my name is Kate. I would like to make an interview with you about \(userDepartmentName!). Could you tell me about your biggest achievement in your life? You can click the phone button when you are ready. You will see two buttons at the next page. The right one is for recording voice and the left one is for stop. When you finish the recording you can check your text and also you can edit it. After all you can send your text directly to our system so we can give you a report." , voice: SynthesisVoice.gb_Kate.rawValue, failure: failure){
            data in
            
            if(self.audioPlayer.isPlaying){
                self.audioPlayer.stop()
                self.audioPlayer = try! AVAudioPlayer(data: data)
                self.audioPlayer.prepareToPlay()
                self.audioPlayer.play()
            }
            else{
                self.audioPlayer = try! AVAudioPlayer(data: data)
                self.audioPlayer.prepareToPlay()
                self.audioPlayer.play()
            }
            
        }
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func call(_ sender: UIButton) {
        
        if(self.audioPlayer.isPlaying){
            self.audioPlayer.stop()
        }
        
        //callImage.stopAnimatingGif()
        performSegue(withIdentifier: "toSpeech", sender: nil)
    }
 
}
