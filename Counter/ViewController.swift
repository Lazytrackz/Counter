//
//  ViewController.swift
//  Counter
//
//  Created by Aleksey Kosichenko on 14.03.2026.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var didTapIncrease: UIButton!
    @IBOutlet private weak var didTapDecrease: UIButton!
    @IBOutlet private weak var didTapReset: UIButton!
    @IBOutlet private weak var historyWindow: UITextView!
    
    // MARK: - Properties
    
    private var count = 0
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        return formatter
    }()
    
    // MARK: - Constants
    
    private enum Constants {
        static let labelPrefix = "Значение счётчика: "
        static let historyTitle = "История изменений:\n"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    // MARK: - Actions
    
    @IBAction private func didTapIncrease(_ sender: UIButton) {
        count += 1
        updateUI()
        addHistory("значение увеличено на +1")
    }
    
    @IBAction private func didTapDecrease(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            updateUI()
            addHistory("значение уменьшено на -1")
        } else {
            addHistory("попытка уменьшить значение ниже 0")
        }
    }
    
    @IBAction private func didTapReset(_ sender: UIButton) {
        count = 0
        updateUI()
        addHistory("значение сброшено")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        countLabel.textAlignment = .center
        countLabel.font = .systemFont(ofSize: 30)
        countLabel.textColor = .purple
        countLabel.layer.borderWidth = 2
        countLabel.layer.borderColor = UIColor.purple.cgColor
        
        configure(button: didTapIncrease, image: "plus.circle", color: .red)
        configure(button: didTapDecrease, image: "minus.circle", color: .blue)
        configure(button: didTapReset, image: "clear", color: .purple)
        
        historyWindow.isEditable = false
        historyWindow.text = Constants.historyTitle
    }
    
    private func configure(button: UIButton, image: String, color: UIColor) {
        button.configuration = .none
        button.setTitle(nil, for: .normal)
        button.tintColor = color
        button.setImage(UIImage(systemName: image), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
    }
    
    private func updateUI() {
        countLabel.text = Constants.labelPrefix + "\(count)"
    }
    
    private func addHistory(_ text: String) {
        let time = dateFormatter.string(from: Date())
        historyWindow.text += "\(time):\n\(text)\n"
        
        let range = NSRange(location: historyWindow.text.count - 1, length: 1)
        historyWindow.scrollRangeToVisible(range)
    }
}
