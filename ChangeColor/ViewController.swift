//
//  ViewController.swift
//  ChangeColor
//
//  Created by 1234 on 06.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //    MARK: - IBOutlets
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorView: UIView!
    var setColor = UIColor.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = colorView.frame.width / 10
        
        defaultValueText()
        getColor()
        sliderValue()
    }
    
//    MARK: - Slider Position
    @IBAction func sliderPosition(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redValue.text = roundValue(sender.value)
        case 1:
            greenValue.text = roundValue(sender.value)
        default:
            blueValue.text = roundValue(sender.value)
        }
        defaultValueText()
    }
    
    // MARK: - Slider value
    private func sliderValue() {
        let sliderValue = CIColor(color: setColor.self)
        
        redSlider.value = Float(sliderValue.red)
        greenSlider.value = Float(sliderValue.green)
        blueSlider.value = Float(sliderValue.blue)
        
        colorView.backgroundColor = setColor.self
    }
    
    //    MARK: - Get Color
    private func getColor() {
        let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        colorView.backgroundColor = color
    }
    // MARK: - Default Value for text Label
    private func defaultValueText() {
        redLabel.text = roundValue(redSlider.value)
        greenLabel.text = roundValue(greenSlider.value)
        blueLabel.text = roundValue(blueSlider.value)
    }
    
    private func roundValue(_ value: Float) -> String {
        String(format: "%.2f")
    }
    
    
}
