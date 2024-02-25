//
//  SignUp4ViewController.swift
//  DoAnTotNghiep
//
//  Created by Trương Minh Lượng Jr on 24/01/2024.
//

import UIKit

class SignUp4ViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var fullScreenOverlayView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        setupTextField()
        setupButtons()
        setupGestures()
        setupDatePicker()
    }
    
    private func setupTextField() {
        dateTextField.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.2)
        dateTextField.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2).cgColor
        dateTextField.layer.borderWidth = 0.5
        dateTextField.layer.cornerRadius = 5.0
        dateTextField.attributedPlaceholder = NSAttributedString(string: dateTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)])
    }
    
    private func setupButtons() {
        nextBtn.layer.cornerRadius = 20.0
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        fullScreenOverlayView.addGestureRecognizer(tapGesture)
    }
    
    private func setupDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 600)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "vi_VN")
        
        dateTextField.inputView = datePicker
        dateTextField.text = formatDate(date: Date())
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        UserDefaults.standard.set(dateTextField.text, forKey: "selectedDate")

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUp5VC = mainStoryboard.instantiateViewController(withIdentifier: "SignUp5ViewController") as! SignUp5ViewController
        signUp5VC.modalPresentationStyle = .fullScreen
        signUp5VC.modalTransitionStyle = .crossDissolve
        self.present(signUp5VC, animated: true, completion: nil)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        dateTextField.text = formatDate(date: datePicker.date)
    }
    
    @objc func handleTap() {
        dateTextField.endEditing(true)
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.dateFormat = "dd 'tháng' MM',' yyyy"
        return formatter.string(from: date)
    }
    
    
    
}
