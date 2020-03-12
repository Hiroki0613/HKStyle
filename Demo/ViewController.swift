

import UIKit
import HKStyle

class ViewController: UIViewController {
    
    let imageLabel = HKLabel(textAlignment: .center, fontSize: 20)
    let usernameTextField = HKTextField()
    let actionButton = HKButton(backgroundColor: .systemBlue, title: "ボタンの名前を記入")
    //文字が入力されている場合はtrueになる
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLogoImageLabel()
        configureTextField()
        configureCallToActionButton()
        
    }
    
    
    func configureLogoImageLabel() {
        view.addSubview(imageLabel)
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.text = "文字の入力"
        
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton(){
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushAlertVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc func pushAlertVC () {
        //textFieldに文章が入っていない場合はアラートを出す
        guard isUsernameEntered else {
            presentHKAlertOnMainView(title: "TextFieldが空欄です", message: "何か文字を入力してください", buttonTitle: "OK")
            return
        }
        print("文字が入力されて、ボタンが押されました")
    }
    
    
    func presentHKAlertOnMainView(title: String,message: String, buttonTitle: String) {
        let alertVC = HKAlertVC(title: title, message: message, buttonTitle: buttonTitle)
    
        //アラートを画面全体にクロスディゾルブでポップアップして出す。
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true, completion: nil)
    }
}



