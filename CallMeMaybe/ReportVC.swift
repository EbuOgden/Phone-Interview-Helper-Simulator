//
//  ReportVC.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

class ReportVC: UIViewController {
    
    private var emotionReportInformations = [EmotionalToneReport]()
    private var socialReportInformations = [SocialToneReport]()
    private var fiveReportInformations = [FiveEmotionsReport]()
    
    var getEmotionReportInformation : [EmotionalToneReport]{
        get {
            return emotionReportInformations
        }
        set {
            emotionReportInformations = newValue
        }
    }
    
    var getSocialReportInformation : [SocialToneReport]{
        get {
            return socialReportInformations
        }
        set {
            socialReportInformations = newValue
        }
    }
    
    var getFiveReportInformation: [FiveEmotionsReport]{
        get {
            return fiveReportInformations
        }
        set {
            fiveReportInformations = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func emotionalButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "showReport", sender: "Emotion")
        
    }
    
    @IBAction func socialButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "showReport", sender: "Social")
    }
    
    @IBAction func fiveEmotionButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "showReport", sender: "Five")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ShowReportVC {
            if let report = sender as? String{
                switch report {
                case "Emotion":
                    destination.getEmotionReportInformation = emotionReportInformations
                    break
                case "Social":
                    destination.getSocialReportInformation = socialReportInformations
                    break
                case "Five":
                    destination.getFiveReportInformation = fiveReportInformations
                    break
                default:
                    break
                }
                
            }
        }
    }
}
