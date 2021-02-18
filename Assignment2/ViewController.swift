//
//  ViewController.swift
//  Assignment2
//
//  Created by Eric Kirchman on 2/17/21.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    var bill_amount: CGFloat = CGFloat(0.00)
    var tip_percentage: Int = 20
    var party_size: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
            guard let firstNumberString = myTextField.text, !firstNumberString.isEmpty, let firstNumber = Int(firstNumberString) else {
            // print("Error - invalid first number")
            displayError("Please enter a valid first number", textField: myTextField)
            return
        }
        
        print(firstNumber)
    }
    
    @IBAction func firstStepper(_ sender: UIStepper) {
        print(sender.value)
    }
    
    
    @IBAction func secondStepper(_ sender: UIStepper) {
        print(sender.value)
    }
    
    
    
    
    func displayError(_ message: String, textField: UITextField) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true) {
            textField.text = ""
        }
    }
    
}
