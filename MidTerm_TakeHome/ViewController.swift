//
//  ViewController.swift
//  MidTerm_TakeHome
//
//  Created by user237042 on 3/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var inputCity: UITextField!
    
    let cityImageMap: [String: String] = [
            "Canada": "Canada.jpg",
            "Calgary": "Calgary.jpg",
            "Halifax": "Halifax.jpg",
            "Montreal": "Montreal.jpg",
            "Toronto": "Toronto.jpg",
            "Vancouver": "Vancouver.jpg",
            "Winnipeg": "Winnipeg.jpg"
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set default image for "Canada"
                if let defaultImageName = cityImageMap["Canada"] {
                    imageView.image = UIImage(named: defaultImageName)
                } else {
                    errorText.text = "Image not found"
                    
                }
        // dismiss the keyboard

                let tapOutSide = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

                view.addGestureRecognizer(tapOutSide)
    }
        // use to dismiss keyboard

        @objc func dismissKeyboard(){

            view.endEditing(true)

        }
        
        // dismiss the keyboard on done

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            textField.resignFirstResponder()

            return true

        }
    
    
    @IBOutlet weak var errorText: UILabel!
    
    @IBAction func searchCity(_ sender: UIButton) {
        guard let cityName = inputCity.text else {
            return
        }
        
        
        if let imageName = cityImageMap[cityName] {
            imageView.image = UIImage(named: imageName)
        }
        else if(inputCity.text!.isEmpty){

            errorText.text = "Please enter city name"

                }
            else{

                errorText.text = "City not found or invalid input"

                }
        
    }
    
}

