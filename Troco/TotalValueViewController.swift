//
//  TotalValueViewController.swift
//  Troco
//
//  Created by Alisson L. Selistre on 28/10/17.
//  Copyright © 2017 Alisson. All rights reserved.
//

import UIKit

class TotalValueViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nextButton: UIBarButtonItem!

    // MARK: view

    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        textField.text = totalValue.asMoney()
        textField.becomeFirstResponder()
        updateNextButtonStatus()
    }

    // MARK: helpers

    private func updateNextButtonStatus() {
        nextButton.isEnabled = (totalValue > 0)
    }
}

extension TotalValueViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var value = totalValue

        if let digit = Int(string) {
            value = value * 10 + digit
        }

        if string == "" {
            value = value / 10
        }

        if value > maxValue {
            return false
        }

        totalValue = value
        textField.text = totalValue.asMoney()
        updateNextButtonStatus()
        return false
    }
}
