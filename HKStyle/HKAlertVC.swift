
import UIKit

public class HKAlertVC: UIViewController {
    //アラートを載せるviewを宣言
    public let containerView = UIView()
    public let titleLabel = HKLabel(textAlignment: .center, fontSize: 24)
    public let messageLabel = HKLabel(textAlignment: .center, fontSize: 16)
    public let actionButton = HKButton(backgroundColor: .systemPink, title: "戻る")
    
    
    //initで定義される内容を宣言、情報が入らない場合を想定してオプショナル型で宣言
    public var alertTitle: String?
    public var message: String?
    public var buttonTitle: String?
    
    
    //共通のpadding値を宣言
    public var padding:CGFloat = 20
    
    
    public init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        //アラートを画面全体に暗めの透過背景にてポップアップして出す。
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.77)
        configureContainerView()
        configureTitleLabel()
        configureMessageLabel()
        configureAcitonButton()
    }
    
    
    public func configureContainerView() {
        view.addSubview(containerView)
        //ダームモード対応
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    
    public func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "情報無し"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    public func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "情報無し"
        messageLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    public func configureAcitonButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc public func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}

