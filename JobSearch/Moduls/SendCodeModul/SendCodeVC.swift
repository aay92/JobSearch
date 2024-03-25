import UIKit

protocol PasscodeViewProtocol {
   func enterCode(code: [Int])
}

class SendCodeVC: UIViewController {
    
    weak var sendCodeVC: SendCodeCoordinator?
    
    private lazy var sendCodeOnLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Отправили код на ...."
            view.textColor = .white
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var textLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 16, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var codeStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.spacing = 5
            stack.backgroundColor = .clear
        }
    }(UIStackView())
    
    private lazy var textfieldStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.spacing = 5
            stack.backgroundColor = .clear
        }
    }(UIStackView())
    
    private lazy var conformButton: UIButton = {
        $0.backgroundColor = AppColor.colorTabBarBlue
        $0.setTitle("Подтвердить", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.gray, for: .highlighted)
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: saveBtnAction))
    
    lazy var saveBtnAction = UIAction { _ in
        self.sendCodeVC?.moveTabBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        view.backgroundColor = AppColor.MainViewControllerBG
        (11...14).forEach {
            let view = getCodeView(tag: $0)
            let tf = getTextFieldView(tag: $0)
            codeStack.addArrangedSubview(view)
            textfieldStack.addArrangedSubview(tf)
        }
    }
    
    private func setConstraint(){
        [sendCodeOnLabel,
         textLabel,
         codeStack,
         textfieldStack,
         conformButton].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            sendCodeOnLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 161),
            sendCodeOnLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sendCodeOnLabel.heightAnchor.constraint(equalToConstant: 20),
//
            textLabel.topAnchor.constraint(equalTo: sendCodeOnLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textLabel.heightAnchor.constraint(equalToConstant: 60),
            
            codeStack.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            codeStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            codeStack.widthAnchor.constraint(equalToConstant: 240),

            textfieldStack.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            textfieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textfieldStack.widthAnchor.constraint(equalToConstant: 240),
            
            conformButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 80),
            conformButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            conformButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            conformButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}

extension SendCodeVC {
    private func getCodeView(tag: Int) -> UIView{
        return {
            $0.widthAnchor.constraint(equalToConstant: 48).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 48).isActive = true
            $0.layer.cornerRadius = 8
            $0.tag = tag
            $0.backgroundColor = AppColor.bgViewSearchJob
            return $0
        }(UIView())
    }
    
    private func getTextFieldView(tag: Int) -> UITextField {
        return {
            $0.attributedPlaceholder = NSAttributedString(
                string: "*",
                attributes: [NSAttributedString.Key.foregroundColor: AppColor.textFieldPlaceholder])
            $0.font = .systemFont(ofSize: 31, weight: .regular)
            $0.tintColor = AppColor.textFieldPlaceholder
            $0.textColor = AppColor.textFieldPlaceholder
            $0.widthAnchor.constraint(equalToConstant: 48).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 48).isActive = true
            $0.layer.cornerRadius = 8
            $0.tag = tag
            $0.backgroundColor = .clear
            $0.textAlignment = .center
            $0.keyboardType = .numberPad
            return $0
        }(UITextField())
    }
}

extension SendCodeVC: PasscodeViewProtocol{
    
    func enterCode(code: [Int]) {
        let tag = code.count + 10
        (tag...14).forEach{ view.viewWithTag($0)?.backgroundColor = .none }
        view.viewWithTag(tag)?.backgroundColor = .white
    }
}
