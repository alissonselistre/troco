//
//  ValuePaidViewController.swift
//  Troco
//
//  Created by Alisson L. Selistre on 28/10/17.
//  Copyright © 2017 Alisson. All rights reserved.
//

import UIKit

class ValuePaidViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nextButton: UIBarButtonItem!

    // MARK: view

    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        textField.text = totalPaid.asMoney()
        textField.becomeFirstResponder()
        updateNextButtonStatus()
    }

    // MARK: helpers

    private func updateNextButtonStatus() {
        nextButton.isEnabled = (totalPaid > 0)
    }
}

extension ValuePaidViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var value = totalPaid

        if let digit = Int(string) {
            value = value * 10 + digit
        }

        if string == "" {
            value = value / 10
        }

        if value > maxValue {
            return false
        }

        totalPaid = value
        textField.text = totalPaid.asMoney()
        updateNextButtonStatus()
        return false
    }
}

