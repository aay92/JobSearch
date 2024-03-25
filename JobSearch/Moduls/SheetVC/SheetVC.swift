import UIKit

class SheetVC: UIViewController {
    
    weak var sheetVCCoordinator: SheetVCCoordinator?

    private lazy var jobLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Резюме для отклика"
            view.textColor = .systemGray4
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var nameJobLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "UI/UX дизайнер"
            view.textColor = .white
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Ellipse")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var lineView: UIView = {
        .configure(view: $0) { view in
            view.backgroundColor = .systemGray
        }
    }(UIView())
    
    private lazy var addLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Добавить сопроводительное"
            view.textColor = .systemGreen
            view.font = .systemFont(ofSize: 20, weight: .bold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var conformButton: UIButton = {
        $0.backgroundColor = AppColor.JobViewbuttonBG
        $0.setTitle("Откликнуться", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.gray, for: .highlighted)
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: saveBtnAction))
    
    private lazy var saveBtnAction = UIAction { [self] _ in
        print("Отправить")
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
    }
    
    private func setConstraint(){
        view.backgroundColor = AppColor.MainViewControllerBG
        
        [iconView,
         jobLabel,
         nameJobLabel,
         lineView,
         addLabel,
         conformButton
        ].forEach(view.addSubview(_:))

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: view.topAnchor,constant: 16),
            iconView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            iconView.heightAnchor.constraint(equalToConstant: 48),
            
            jobLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 16),
            jobLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8),
            jobLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameJobLabel.topAnchor.constraint(equalTo: jobLabel.bottomAnchor,constant: 8),
            nameJobLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 8),
            nameJobLabel.heightAnchor.constraint(equalToConstant: 24),
                        
            lineView.topAnchor.constraint(equalTo: iconView.bottomAnchor,constant: 16),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            addLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 40),
            addLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            addLabel.heightAnchor.constraint(equalToConstant: 20),
     
            conformButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            conformButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            conformButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8),
            conformButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
