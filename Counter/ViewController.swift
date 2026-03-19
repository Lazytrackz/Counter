//
//  ViewController.swift
//  Counter
//
//  Created by Aleksey Kosichenko on 14.03.2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyWindow: UITextView!
    private var count: Int = 0
    private var labelText: String = "Значение счётчика: "
    private var historyText: String = "История изменений:\n"
    private var dateFormatter = DateFormatter()
    private var timeString = " "
   
    @IBAction func increaseCountButton(_ sender: Any) {
        let increaseValue: Int = 1
        count += increaseValue
        countLabel.text = labelText + "\(count)"
        timeString  = dateFormatter.string(from: Date())
        historyWindow.text += timeString + ":\n" + "значение изменено на: +\(increaseValue)\n"
    }
    
    
    @IBAction func resetCountButton(_ sender: Any) {
        count = 0
        timeString  = dateFormatter.string(from: Date())
        countLabel.text = labelText + "\(count)"
        historyWindow.text += timeString + ":\n" + "значение сброшено\n"
    }
    
    @IBAction func decreaseCountButton(_ sender: Any) {
        let decreaseValue: Int = 1
        timeString  = dateFormatter.string(from: Date())
        if count > 0 {
            count -= decreaseValue
            countLabel.text = labelText + "\(count)"
            historyWindow.text += timeString + ":\n" + "значение изменено на: -\(decreaseValue)\n"
        }else {
            historyWindow.text += timeString + ":\n" + "попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //configure label with counter
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 30.0)
        countLabel.textColor = .purple
        countLabel.layer.borderWidth = 2.0
        countLabel.layer.borderColor = UIColor.purple.cgColor
        countLabel.text = labelText + "\(count)"
        //configureplus button
        increaseButton.configuration = .none
        increaseButton.setTitle(nil, for: .normal)
        increaseButton.tintColor = .red
        increaseButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        increaseButton.contentVerticalAlignment = .fill
        increaseButton.contentHorizontalAlignment = .fill
        //configure minus button
        decreaseButton.configuration = .none
        decreaseButton.setTitle(nil, for: .normal)
        decreaseButton.tintColor = .blue
        decreaseButton.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        decreaseButton.contentVerticalAlignment = .fill
        decreaseButton.contentHorizontalAlignment = .fill
        //configure reset button
        resetButton.configuration = .none
        resetButton.setTitle(nil, for: .normal)
        resetButton.tintColor = .purple
        resetButton.setImage(UIImage(systemName: "clear"), for: .normal)
        resetButton.contentVerticalAlignment = .fill
        resetButton.contentHorizontalAlignment = .fill
        //configure log window
        historyWindow.isScrollEnabled = true
        historyWindow.isEditable = false
        historyWindow.text = historyText
        //configure date format
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        
    }


}

