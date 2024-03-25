import Foundation
import UIKit

class HintCollectionViewCell: UICollectionViewCell {
    
    static let indicator = "SaleCollectionViewCell"
    
    private let hintViewBG: UIView = {
        let view = UIImageView()
        view.backgroundColor = AppColor.hintViewBG
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var secondLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Вакансии рядом с вами"
            view.textColor = .white
            view.textAlignment = .left
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 20, weight: .medium)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupView(){
        backgroundColor = .clear
        addSubview(hintViewBG)
        addSubview(avatarImageView)
        addSubview(secondLabel)
         
    }
    func configureCell(name: String){
        avatarImageView.image = UIImage(named: name)
    }
   
     func setConstraints(){
         NSLayoutConstraint.activate([
            hintViewBG.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            hintViewBG.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            hintViewBG.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            hintViewBG.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 20),
            
            secondLabel.topAnchor.constraint(equalTo: topAnchor, constant: 58),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            secondLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
         ])
    }
}
