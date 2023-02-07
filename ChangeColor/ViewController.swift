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
    var setColor: UIColor!
    
//    MARK: - Loading Screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = colorView.frame.width / 10
        colorView.backgroundColor = .white
        defaultValueText()
        sliderValue()
        getColor()
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
        getColor()
    }
    
    // MARK: - Slider value
    private func sliderValue() {
        let sliderValue = CIColor(color: setColor ?? .white)
        
        redSlider.value = Float(sliderValue.red)
        greenSlider.value = Float(sliderValue.green)
        blueSlider.value = Float(sliderValue.blue)
        
        colorView.backgroundColor = setColor
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
        redValue.text = roundValue(redSlider.value)
        greenValue.text = roundValue(greenSlider.value)
        blueValue.text = roundValue(blueSlider.value)
        
    }
    
    private func roundValue(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    
}
