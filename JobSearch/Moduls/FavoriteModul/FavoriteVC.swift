import UIKit

class FavoriteVC: UIViewController {
    
//    weak var mainViewControllerCoordinator: MainViewControllerCoordinator?
    private let sections = MockData.shared.pageDataFavorite
    
    private lazy var favoriteLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Избранное"
            view.textColor = .white
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var countJobs: UILabel = {
        .configure(view: $0) { view in
            view.text = "1 вакансия"
            view.textColor = AppColor.colorTabBarGray4
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let jobButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Еще 141 вакансии", for: .normal)
        button.backgroundColor = AppColor.continueButtonNotActive
        button.tintColor = AppColor.continueButtonNotActiveColorText
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrane()
        setDelegates()
    }

    func setupViews(){
        collectionView.register(JobCollectionViewCell.self,
                                forCellWithReuseIdentifier: JobCollectionViewCell.indicator)
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:
                                    HeaderSupplementaryView.indicator)
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setConstrane(){
        view.backgroundColor = AppColor.MainViewControllerBG

        [favoriteLabel,
         countJobs,
         collectionView].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            
            favoriteLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            favoriteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favoriteLabel.heightAnchor.constraint(equalToConstant: 50),
            
            countJobs.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 16),
            countJobs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            countJobs.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            countJobs.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: countJobs.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
//MARK: - Create Layout
extension FavoriteVC {
    private func createLayout()-> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in
            guard let self = self else { return nil }
         
            let section = self.sections[sectionsIndex]
            
            switch section {
            case .vacancy(_):
                return self.createCategorySection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool)-> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    

    private func createCategorySection()-> NSCollectionLayoutSection{
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.47)),
            subitems: [.init(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        section.interGroupSpacing = 16
        return section
    }
    
    private func supplementaryHeaderItem()->NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize:
                .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(30)), elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
    }
}

//MARK: - UICollectionViewDelegate
extension FavoriteVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

//MARK: - UICollectionViewDataSource
extension FavoriteVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sections[indexPath.section] {
        case .vacancy( let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCollectionViewCell.indicator, for: indexPath) as? JobCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].images)

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
