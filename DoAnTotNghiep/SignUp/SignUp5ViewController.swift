//
//  SignUp5ViewController.swift
//  DoAnTotNghiep
//
//  Created by Trương Minh Lượng Jr on 29/01/2024.
//

import UIKit

class SignUp5ViewController: UIViewController {
    
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userNameClearBtn: UIButton!
    @IBOutlet weak var userNameClearImage: UIImageView!
    @IBOutlet weak var userNameClearView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    private var isUserNamelHasText: Bool = false {
        didSet {
            userNameClearView.isHidden = !isUserNamelHasText
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setupTextField()
        setupButtons()
        setupGestures()
    }
    
    private func setupTextField() {
        isUserNamelHasText = false
        
        userNameTF.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.2)
        userNameTF.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2).cgColor
        userNameTF.layer.borderWidth = 0.5
        userNameTF.layer.cornerRadius = 5.0
        userNameTF.placeholder = "Tên người dùng"
        userNameTF.attributedPlaceholder = NSAttributedString(string: userNameTF.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)])
        
        userNameClearView.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.2)
    }
    
    private func setupButtons() {
        nextBtn.layer.cornerRadius = 20.0
    }
    
    private func setupGestures() {
        let clickBackTapGesture = UITapGestureRecognizer(target: self, action: #selector(clickBack))
        backImage.addGestureRecognizer(clickBackTapGesture)
        backImage.isUserInteractionEnabled = true
        
        userNameTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        if let userName = userNameTF.text , !userName.isEmpty {
            UserDefaults.standard.set(userName, forKey: "userName")
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let signUp6VC = mainStoryboard.instantiateViewController(withIdentifier: "SignUp6ViewController") as! SignUp6ViewController
            signUp6VC.modalPresentationStyle = .fullScreen
            signUp6VC.modalTransitionStyle = .crossDissolve
            self.present(signUp6VC, animated: true, completion: nil)
        } else {
            self.view.makeToast("Tên người dùng không được để trống!")
        }
    }
    
    @objc func clickBack() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUp4VC = mainStoryboard.instantiateViewController(withIdentifier: "SignUp4ViewController") as! SignUp4ViewController
        signUp4VC.modalPresentationStyle = .fullScreen
        signUp4VC.modalTransitionStyle = .crossDissolve
        self.present(signUp4VC, animated: true, completion: nil)
    }
    
    @objc func textFieldDidChange() {
        isUserNamelHasText = !(userNameTF.text?.isEmpty ?? true)
    }

    @IBAction func clearUserName(_ sender: Any) {
        userNameTF.text = nil
        isUserNamelHasText = false
    }
    

}
