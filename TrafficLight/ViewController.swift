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
    
    var light = "red"

    override func viewDidLoad() {
        
        super.viewDidLoad()

        changeColorButton.layer.cornerRadius = 10

        changeColorButton.configuration = setupButton(with: "START")

        setupViewToCircle(redView, color: .red)
        setupViewToCircle(yellowView, color: .yellow)
        setupViewToCircle(greenView, color: .green)
        
    }

    @IBAction func selectLightButton(_ sender: UIView) {
        changeColorButton.configuration = setupButton(with: "NEXT")
                
        switch light {
        case "red":
            redView.alpha = 1
            greenView.alpha = 0.33
            light = "yellow"
        case "yellow":
            yellowView.alpha = 1
            redView.alpha = 0.33
            light = "green"
        case "green":
            yellowView.alpha = 0.33
            greenView.alpha = 1
            light = "red"
        default:
            break
        }
    }

    private func setupViewToCircle (_ view: UIView, color: UIColor) {

        view.layer.cornerRadius = view.layer.bounds.height * 0.5
        print(view.layer.cornerRadius)
        print(view.layer.bounds.height)
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

