//
//  CalculateViewController.swift
//  MidTerm_TakeHome
//
//  Created by user237042 on 3/11/24.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var textFieldA: UITextField!
    @IBOutlet weak var textFieldB: UITextField!
    @IBOutlet weak var textFieldC: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        
    }
    
    func configureTextFields() {
            textFieldA.keyboardType = .decimalPad
            textFieldB.keyboardType = .decimalPad
            textFieldC.keyboardType = .decimalPad
        }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        guard let aValue = Double(textFieldA.text ?? ""),
                      let bValue = Double(textFieldB.text ?? ""),
                      let cValue = Double(textFieldC.text ?? "") else {
                    resultTextView.text = "Enter a value for A, B, and C to find X."
                    return
        }
        
        if aValue == 0 {
                    resultTextView.text = "A cannot be zero for a quadratic equation."
                    return
                }
        let discriminant = bValue * bValue - 4 * aValue * cValue

        if discriminant < 0 {
            resultTextView.text = "There are no results since the discriminant is less than zero."
        }
        else if discriminant == 0 {
        let x = -bValue / (2 * aValue)
        resultTextView.text = "There is only one value for X: \(x)"
        }
        else {
            let x1 = (-bValue + sqrt(discriminant)) / (2 * aValue)
            let x2 = (-bValue - sqrt(discriminant)) / (2 * aValue)
            resultTextView.text = "There are two values for X: \(x1) and \(x2)"
        }
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        textFieldA.text = ""
        textFieldB.text = ""
        textFieldC.text = ""
        resultTextView.text = ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
