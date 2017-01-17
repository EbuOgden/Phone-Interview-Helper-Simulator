//
//  ShowReportVC.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

import ScrollableGraphView

class ShowReportVC: UIViewController {
    var label = UILabel()
    
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

    var scrollableGraph = ScrollableGraphView()
    
    var scores = [Double]()
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollableGraph = createDotGraph(self.view.frame)
        
        if emotionReportInformations.count != 0 {
            for i in 0..<emotionReportInformations.count{
                scores.append(Double(emotionReportInformations[i].score) * 100)
                names.append(emotionReportInformations[i].name)
            }
            
            scrollableGraph.set(data: scores, withLabels: names)
            
            self.view.addSubview(scrollableGraph)
            addLabel(text: "Close", place: scrollableGraph)
        }
        else if socialReportInformations.count != 0 {
            for i in 0..<socialReportInformations.count{
                scores.append(Double(socialReportInformations[i].score) * 100)
                names.append(socialReportInformations[i].name)
            }
            
            scrollableGraph.set(data: scores, withLabels: names)
            
            self.view.addSubview(scrollableGraph)
            addLabel(text: "Close", place: scrollableGraph)
        }
        else if fiveReportInformations.count != 0 {
            for i in 0..<fiveReportInformations.count{
                scores.append(Double(fiveReportInformations[i].score) * 100)
                names.append(fiveReportInformations[i].name)
            }
            
            scrollableGraph.set(data: scores, withLabels: names)
            
            self.view.addSubview(scrollableGraph)
            addLabel(text: "Close", place: scrollableGraph)
        }
        
        
        
    }
    
    func didTap(_ gesture: UITapGestureRecognizer) {
        self.removeFromParentViewController()
        self.dismiss(animated: true, completion: nil)
    }


    
    private func addLabel(text: String, place: UIView){
        label.removeFromSuperview()
        
        label = createNewLabel(text: text)
        label.isUserInteractionEnabled = true
        
        let rightConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: place, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -20)
        
        let topConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: place, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 20)
        
        let heightConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        let widthConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: label.frame.width * 1.5)
        
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTap))
        label.addGestureRecognizer(tapGestureRecogniser)
        
        self.view.insertSubview(label, aboveSubview: place)
        self.view.addConstraints([rightConstraint, topConstraint, heightConstraint, widthConstraint])
        
    }
    
    private func createNewLabel(text: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        label.text = text
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        
        return label
    }
    
    private func createDotGraph(_ frame: CGRect) -> ScrollableGraphView {
        
        let graphView = ScrollableGraphView(frame:frame)
        
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#00BFFF")
        graphView.lineColor = UIColor.clear
        
        graphView.dataPointSize = 10
        graphView.dataPointSpacing = 100
        graphView.dataPointLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.dataPointLabelColor = UIColor.white
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.5)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.referenceLinePosition = ScrollableGraphViewReferenceLinePosition.both
        
        graphView.numberOfIntermediateReferenceLines = 9
        
        graphView.rangeMax = 100
        
        return graphView
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

}
