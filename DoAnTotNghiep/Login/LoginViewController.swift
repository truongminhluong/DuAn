//
//  LoginViewController.swift
//  DoAnTotNghiep
//
//  Created by Trương Minh Lượng Jr on 17/01/2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailClearBtn: UIButton!
    
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passEyeBtn: UIButton!
    
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var facebookLoginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0)
        
        setup()

    }
    
    func setup() {
        emailTF.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.2)
        emailTF.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2).cgColor
        emailTF.layer.borderWidth = 0.5
        emailTF.layer.cornerRadius = 5.0
        emailTF.placeholder = "Tên người dùng,email/ số điện thoại"
        emailTF.attributedPlaceholder = NSAttributedString(string: emailTF.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)])

        
        passTF.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.2)
        passTF.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2).cgColor
        passTF.layer.borderWidth = 0.5
        passTF.layer.cornerRadius = 5.0
        passTF.placeholder = "Mật khẩu"
        passTF.attributedPlaceholder = NSAttributedString(string: passTF.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)])
        
        loginBtn.layer.cornerRadius = 5.0

    }
    
    @IBAction func onHandleButton(_ sender: UIButton) {
        switch sender {
        case emailClearBtn: 
            break
        case passEyeBtn:
            break
        case forgotPasswordBtn:
            break
        case loginBtn:
            break
        case facebookLoginBtn:
            break
        case signUpBtn:
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let signUpVC = mainStoryboard.instantiateViewController(withIdentifier: "SignUp1ViewController") as! SignUp1ViewController
            signUpVC.modalPresentationStyle = .fullScreen
            signUpVC.modalTransitionStyle = .crossDissolve
            self.present(signUpVC, animated: true, completion: nil)
            
            break
        default:
            break
        }
    }
    
        

    

}
