import UIKit

final class MapView: UIView {
    
    private lazy var BGView : UIView = {
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
    
    private lazy var nameCompany: UILabel = {
        .configure(view: $0) { view in
            view.text = "Мобирикс"
            view.textColor = .white
            view.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }(UILabel())
   
    private lazy var addressCompanyLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Минск, улица Бирюзова 4/5"
            view.textColor = .white
            view.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }(UILabel())
    
    private let mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "map")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(vacancy: Vacancy){
        nameCompany.text = vacancy.company
        addressCompanyLabel.text = vacancy.address.street
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        
        [BGView,
        nameCompany,
        mapImageView,
        addressCompanyLabel].forEach(addSubview(_:))
        
 
        NSLayoutConstraint.activate([
            BGView.topAnchor.constraint(equalTo:topAnchor),
            BGView.leadingAnchor.constraint(equalTo: leadingAnchor),
            BGView.trailingAnchor.constraint(equalTo: trailingAnchor),
            BGView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            mapImageView.topAnchor.constraint(equalTo: nameCompany.bottomAnchor, constant: 20),
            mapImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            mapImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            mapImageView.heightAnchor.constraint(equalToConstant: 50),
           
            nameCompany.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameCompany.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameCompany.heightAnchor.constraint(equalToConstant: 20),

            addressCompanyLabel.topAnchor.constraint(equalTo: mapImageView.bottomAnchor, constant: 10),
            addressCompanyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            addressCompanyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
