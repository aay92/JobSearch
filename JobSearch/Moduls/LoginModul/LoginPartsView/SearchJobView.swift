import UIKit

final class SearchJobView: UIView {
    
    private lazy var searchJobLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Поиск работы"
            view.textColor = .white
            view.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }(UILabel())
    
    private lazy var textFieldBG : UIView = {
        .configure(view: $0) { view in
            view.backgroundColor = AppColor.textFieldBG
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = false
            view.layer.shadowRadius = 2.0
            view.layer.shadowColor = AppColor.textFieldShadow.cgColor
            view.layer.shadowOffset = .init(width: 0, height: 5)
            view.layer.shadowOpacity = 5.0
        }
    }(UIView())
    
    private lazy var nameTextField: UITextField = {
        let label = UITextField()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        label.keyboardType = .emailAddress
        label.textAlignment = .left
        label.tintColor = .white
        label.layer.cornerRadius = 10
        label.attributedPlaceholder = NSAttributedString(
            string: "  Электронная почта или телефон",
            attributes: [NSAttributedString.Key.foregroundColor: AppColor.textFieldPlaceholder])
        label.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        let image = UIImage(named: "massage")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        label.leftView = imageView
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInWithPassword: UILabel = {
        .configure(view: $0) { view in
            view.text = "Войти с паролем"
            view.textColor = AppColor.signInWithPassword
            view.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }(UILabel())
    
    lazy var continueButton: UIButton = {
        $0.backgroundColor = AppColor.continueButtonNotActive
        $0.setTitle("Продолжить", for: .normal)
        $0.setTitleColor(
            AppColor.continueButtonNotActiveColorText,
            for: .normal)
        $0.setTitleColor(.gray, for: .highlighted)
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
//        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 20
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var saveBtnAction = UIAction { _ in
        print("Действие при нажатие кнопки сохранить")
    }

    init(){
        super.init(frame: .zero)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        [searchJobLabel,
         textFieldBG,
         nameTextField,
         buttonStackView].forEach(addSubview(_:))
         
         [continueButton,
          signInWithPassword].forEach(buttonStackView.addArrangedSubview(_:))
 
        NSLayoutConstraint.activate([
            searchJobLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            searchJobLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchJobLabel.heightAnchor.constraint(equalToConstant: 20),

            textFieldBG.topAnchor.constraint(equalTo: searchJobLabel.bottomAnchor, constant: 16),
            textFieldBG.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textFieldBG.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldBG.heightAnchor.constraint(equalToConstant: 40),

            nameTextField.topAnchor.constraint(equalTo: searchJobLabel.bottomAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),

            buttonStackView.topAnchor.constraint(equalTo:
                nameTextField.bottomAnchor, constant: 16),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}
