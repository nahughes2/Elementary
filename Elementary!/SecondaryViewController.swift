//
//  SecondaryViewController.swift
//  Elementary!
//
//  Created by Nathan Hughes on 3/5/22.
//

import Foundation
import UIKit

class SecondaryViewController: UIViewController {
    
    @IBOutlet weak var introTitle: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    @IBOutlet weak var funFactLabel: UILabel!
    
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var standardStateLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var boilingPointLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var elementColorView: UIView!
    @IBOutlet weak var chalkboardView: UIView!
    @IBOutlet weak var fauxWoodFrameView: UIView!
    
    var element: Element?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentElement = element {
            idLabel.text = currentElement.name
            introTitle.text = "Fun facts about \(currentElement.name)!"
            elementColorView.backgroundColor = getColor()
            atomicNumberLabel.text = element?.atomicNumber
            let chalkBoardColor = UIColor(red: 11/255.0, green: 89/255.0, blue: 69/255.0, alpha: 1.0)
            let fauxWoodColor = UIColor(red: 93/255.0, green: 55/255.0, blue: 20/255.0, alpha: 1.0)
            
            chalkboardView.backgroundColor = chalkBoardColor
            fauxWoodFrameView.backgroundColor = fauxWoodColor
            
            massLabel.text = element?.atomicMass
            standardStateLabel.text = element?.standardState
            symbolLabel.text = element?.symbol
            boilingPointLabel.text = element?.boilingPoint
            historyTextView.isEditable = false
            historyTextView.text = element?.history
        }
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getColor() -> UIColor {
        if let currentElement = element {
            if let color = UIColor(hex: "#\(currentElement.cpkHexColor)") {
                return color
            }
        }
        return UIColor.white
    }
}



