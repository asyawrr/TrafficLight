//
//  ViewController.swift
//  TrafficLight
//
//  Created by Asya Sher on 21.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var changeColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeColorButton.layer.cornerRadius = 10
        changeColorButton.configuration = setupButton(with: "START")
        
        setupViewToCircle(redView, color: .red)
        setupViewToCircle(yellowView, color: .yellow)
        setupViewToCircle(greenView, color: .green)
        
        selectLight(changeColorButton)
        
    }


    @IBAction func selectLight(_ sender: UIButton) {
        if  changeColorButton.currentTitle == "START" {
            redView.alpha = 1
        }
        
        
    }
    
    private func setupViewToCircle (_ view: UIView, color: UIColor) {
        
        view.layer.cornerRadius = view.layer.bounds.width/2
        view.clipsToBounds = true
        view.backgroundColor = color
        view.alpha = 0.33
    }
    
    private func setupButton(with title: String) -> UIButton.Configuration {
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        buttonConfiguration.title = title
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        return buttonConfiguration
        
        
    }
}

