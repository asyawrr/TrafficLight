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
    
    var counter = 0

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
                
        let views = [redView, yellowView, greenView]
        
        for view in views {
            view?.alpha = 0.33
        }
        
        let index = counter % 3
        views[index]?.alpha = 1
        counter += 1
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

