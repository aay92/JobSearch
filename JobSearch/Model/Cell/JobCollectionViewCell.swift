import UIKit

class jobCollectionViewCell: UICollectionViewCell {
    
    static let indicator = "jobCollectionViewCell"
    
    private let categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "categoryBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConsrtaints()
        backgroundColor = .systemYellow

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(categoryName: String, imageName: String){
        categoryLabel.text = categoryName
        categoryImage.image = UIImage(named: imageName)
    }
    
    private func setView(){
        layer.cornerRadius = 10
        addSubview(categoryImage)
        addSubview(categoryLabel)
    }
    
    private func setConsrtaints(){
        
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            categoryImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryImage.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 0),
            
        ])
    }

}

