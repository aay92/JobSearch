import UIKit

class JobCollectionViewCell: UICollectionViewCell {
    
    static let indicator = "JobCollectionViewCell"
    
    private let firstLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Сейчас просматривает 1 человек"
            view.textColor = AppColor.JobViewbuttonBG
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .medium)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameOfProfessionLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "UI/UX Designer"
            view.textColor = .white
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 20, weight: .medium)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var salaryLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "1500-2900 Br"
            view.textColor = .white
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var experienceLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Опыт от 1 года до 3 лет"
            view.textColor = .white
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .medium)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var townLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Миснк"
            view.textColor = AppColor.colorTabBarGray4
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .regular)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var companyLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Мобирикс"
            view.textColor = AppColor.colorTabBarGray4
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .regular)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var dataLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Опубликовано 20 февраля"
            view.textColor = AppColor.colorTabBarGray4
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .medium)
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
    
    private lazy var saveBtnAction = UIAction { _ in
        print("Действие при нажатие кнопки сохранить")
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    func configure(data: Vacancy){
        guard let num = data.lookingNumber else { return }
        firstLabel.text = "Сейчас просматривает \(num) человек"
        nameOfProfessionLabel.text = data.title
        experienceLabel.text = data.experience.previewText
        townLabel.text = data.address.town
        companyLabel.text = data.company
        dataLabel.text = data.publishedDate
        
        if data.isFavorite { 
            heartImageView.image = UIImage(named: "HeartFill")
        } else {
            heartImageView.image = UIImage(named: "Heart")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConsrtaints()
        backgroundColor = AppColor.JobViewBG

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(categoryName: String, imageName: String){
//        categoryLabel.text = categoryName
    }
    
    private func setView(){
        layer.cornerRadius = 10
        [heartImageView,
         firstLabel,
         nameOfProfessionLabel,
         salaryLabel,
         experienceLabel,
         townLabel,
         companyLabel,
         dataLabel,
         conformButton
        ].forEach(addSubview(_:))
    }
    
    private func setConsrtaints(){
        
        NSLayoutConstraint.activate([
            heartImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            heartImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heartImageView.heightAnchor.constraint(equalToConstant: 24),
            
            firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstLabel.heightAnchor.constraint(equalToConstant: 14),
            
            nameOfProfessionLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 16),
            nameOfProfessionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameOfProfessionLabel.heightAnchor.constraint(equalToConstant: 16),
            
            salaryLabel.topAnchor.constraint(equalTo: nameOfProfessionLabel.bottomAnchor, constant: 16),
            salaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            salaryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            experienceLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 16),
            experienceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            experienceLabel.heightAnchor.constraint(equalToConstant: 16),
            
            townLabel.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 16),
            townLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            townLabel.heightAnchor.constraint(equalToConstant: 16),
            
            companyLabel.topAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 8),
            companyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            companyLabel.heightAnchor.constraint(equalToConstant: 16),
            
            dataLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 16),
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dataLabel.heightAnchor.constraint(equalToConstant: 16),
            
            conformButton.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 16),
            conformButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            conformButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            conformButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }

}

