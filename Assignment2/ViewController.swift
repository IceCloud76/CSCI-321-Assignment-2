//
//  ViewController.swift
//  Assignment2
//
//  Created by Eric Kirchman on 2/17/21.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var yourShareLabel: UILabel!
    
    
    
    
    var bill_amount: CGFloat = CGFloat(0.00) //the initial amount input by the user
    var tip_percentage: Int = 20 // the amount the user wants to tip. In percentage (whole numbers)
    var party_size: Int = 1 // party size (whole numbers. Min: 1 Max: 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
            guard let firstNumberString = myTextField.text, !firstNumberString.isEmpty, let firstNumber = Double(firstNumberString) else {
            // print("Error - invalid first number")
            displayError("Please enter a valid first number", textField: myTextField)
            return
        }
        if (firstNumber < 0){ //check if number is negative. If so, throw up an error
            displayError("Please enter a valid first number", textField: myTextField)
            return
        }
        
        print("Bill amount: \(firstNumber)") //print statements are for debugging
        
        bill_amount = CGFloat(firstNumber)
        let tempTipPercent: Double = Double(tip_percentage) / 100 //It's not a percentage, it's a decimal (ei. 0.2)
        print("temptip amount: \(tempTipPercent)") //print statements are for debugging
        
        let tipAmount = (bill_amount * CGFloat(tempTipPercent))
        print("tip amount: \(tipAmount)")
        
        let totalBill = tipAmount + bill_amount
        print("Total Bill amount: \(totalBill)")
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        let forTotalBill = NSNumber(value: Double(totalBill))
        var formattedValue = formatter.string(from: forTotalBill)!
        totalBillLabel.text = "\(formattedValue)"
        
        let yourShare = totalBill / CGFloat(party_size)
        print("party_Size: \(party_size)")
        print("let yourShare: \(yourShare)")
        let forYourShare = NSNumber(value: Double(yourShare))
        formattedValue = formatter.string(from: forYourShare)!
        yourShareLabel.text = "\(formattedValue)"
        
        
    }
    
    @IBAction func firstStepper(_ sender: UIStepper) {
        print(sender.value)
        let formattedValue = String(format: "%.0f", sender.value)
        tipLabel.text = "\(formattedValue)%"
        tip_percentage = Int(sender.value)
    }
    
    
    @IBAction func secondStepper(_ sender: UIStepper) {
        print(sender.value)
        let formattedValue = String(format: "%.0f", sender.value)
        partySizeLabel.text = "\(formattedValue)"
        party_size = Int(sender.value)
    }
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) //retracts the keyboard when we touch outside of the textfield
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
