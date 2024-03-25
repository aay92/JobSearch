import UIKit

final class SearchEmployee: UIView {
    
    private lazy var searchEmployeeLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Поиск сотрудников"
            view.textColor = AppColor.buttonTextColor
            view.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }(UILabel())
    
    private lazy var resumeLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Размещение вакансий и доступ к базе резюме"
            view.numberOfLines = 0
            view.textColor = AppColor.buttonTextColor
            view.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }(UILabel())
    
    private lazy var continueButton: UIButton = {
        $0.backgroundColor = AppColor.buttonBG
        $0.setTitle("Я ищу сотрудников", for: .normal)
        $0.setTitleColor(.white,
            for: .normal)
        $0.setTitleColor(.white, for: .highlighted)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
//        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: saveBtnAction))
    
    
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
        [searchEmployeeLabel,
         resumeLabel,
         continueButton].forEach(addSubview(_:))
         
 
        NSLayoutConstraint.activate([
            searchEmployeeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            searchEmployeeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchEmployeeLabel.heightAnchor.constraint(equalToConstant: 20),

            resumeLabel.topAnchor.constraint(equalTo: searchEmployeeLabel.bottomAnchor, constant: 16),
            resumeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            resumeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            resumeLabel.heightAnchor.constraint(equalToConstant: 20),

            continueButton.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 16),
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
