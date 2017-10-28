//
//  ResultViewController.swift
//  Troco
//
//  Created by Alisson L. Selistre on 28/10/17.
//  Copyright © 2017 Alisson. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var changeLabel: UILabel!

    @IBOutlet weak var real2Label: UILabel!
    @IBOutlet weak var real5Label: UILabel!
    @IBOutlet weak var real10Label: UILabel!
    @IBOutlet weak var real20Label: UILabel!
    @IBOutlet weak var real50Label: UILabel!
    @IBOutlet weak var real100Label: UILabel!

    @IBOutlet weak var centavo1Label: UILabel!
    @IBOutlet weak var centavo5Label: UILabel!
    @IBOutlet weak var centavo10Label: UILabel!
    @IBOutlet weak var centavo25Label: UILabel!
    @IBOutlet weak var centavo50Label: UILabel!
    @IBOutlet weak var real1Label: UILabel!

    // MARK: view

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateChange()
        populateUI()
        resetResult()
    }

    // MARK: actions

    @IBAction func restartButtonPressed(_ sender: UIBarButtonItem) {
        resetValues()
        navigationController?.popToRootViewController(animated: true)
    }

    // MARK: helpers

    private func calculateChange() {
        for money in Money.cases {
            while (money.rawValue + partialChange) <= totalChange {
                moneyList.append(money)
            }
        }
    }

    private func populateUI() {

        var changeText = ""
        if totalChange >= 0 {
            changeLabel.textColor = .black
            changeText += "Troco: "
        } else {
            changeLabel.textColor = .red
            changeText += "Falta: "
        }

        changeText += currencyFormater.string(from: NSNumber(value: Double(abs(totalChange)) / 100)) ?? "-"
        changeLabel.text = changeText

        real2Label.text = "\(moneyList.filter { $0 == .real2 }.count)"
        real5Label.text = "\(moneyList.filter { $0 == .real5 }.count)"
        real10Label.text = "\(moneyList.filter { $0 == .real10 }.count)"
        real20Label.text = "\(moneyList.filter { $0 == .real20 }.count)"
        real50Label.text = "\(moneyList.filter { $0 == .real50 }.count)"
        real100Label.text = "\(moneyList.filter { $0 == .real100 }.count)"

        centavo1Label.text = "\(moneyList.filter { $0 == .centavo1 }.count)"
        centavo5Label.text = "\(moneyList.filter { $0 == .centavo5 }.count)"
        centavo10Label.text = "\(moneyList.filter { $0 == .centavo10 }.count)"
        centavo25Label.text = "\(moneyList.filter { $0 == .centavo25 }.count)"
        centavo50Label.text = "\(moneyList.filter { $0 == .centavo50 }.count)"
        real1Label.text = "\(moneyList.filter { $0 == .real1 }.count)"
    }

    private func resetValues() {
        totalValue = 0
        totalPaid = 0
        moneyList.removeAll()
    }

    private func resetResult() {
        moneyList.removeAll()
    }
}
