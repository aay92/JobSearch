import UIKit

final class SearchBarView: UIView {
    
    private lazy var viewBG: UIView = {
        .configure(view: $0) { view in
            view.backgroundColor = AppColor.bgViewSearchJob
            view.clipsToBounds = true
            view.layer.cornerRadius = 8
        }
    }(UILabel())
    
    private lazy var viewButtonBG: UIView = {
        .configure(view: $0) { view in
            view.backgroundColor = AppColor.bgViewSearchJob
            view.layer.cornerRadius = 8
        }
    }(UILabel())
    
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
            string: "  Должность, ключевые слова",
            attributes: [NSAttributedString.Key.foregroundColor: AppColor.textFieldPlaceholder])
        label.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        let image = UIImage(named: "loop")?.withTintColor(AppColor.textFieldPlaceholder)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        label.leftView = imageView
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let smallButton: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "SmallButton")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var saveBtnAction = UIAction { _ in
        print("Действие при нажатие кнопки я ищу сотрудников")
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
        [viewBG,
         viewButtonBG,
         nameTextField,
         smallButton].forEach(addSubview(_:))
         
 
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: topAnchor),
            viewBG.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            viewBG.bottomAnchor.constraint(equalTo: bottomAnchor),

            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameTextField.trailingAnchor.constraint(equalTo: viewBG.trailingAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            viewButtonBG.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            viewButtonBG.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            viewButtonBG.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            smallButton.topAnchor.constraint(equalTo: topAnchor),
            smallButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            smallButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            smallButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
