import UIKit

class MainViewController: UIViewController {
    
    weak var mainViewControllerCoordinator: MainViewControllerCoordinator?
    private let sections = MockData.shared.pageData

    var viewModel = MainViewModel()
    private var data: Job?
    
    private lazy var searchBarView: SearchBarView = {
        .configure(view: $0) { view in
            view.clipsToBounds = true
            view.layer.cornerRadius = 8
        }
    }(SearchBarView())

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
        getJobsWithServer()
        setupViews()
        setConstrane()
        setDelegates()
    }
    
    private func getJobsWithServer(){
        Task {
            var jobs = await self.viewModel.getDataWithJobs()
            if (jobs.vacancies.count == 0) || (jobs.offers.count == 0) {
                print("Нет элементов с сервера \(jobs)")
            } else {
                print(jobs.vacancies.count)
                print(jobs.offers.count)
            }
        }
    }

    func setupViews(){
        collectionView.register(HintCollectionViewCell.self,
                                forCellWithReuseIdentifier: HintCollectionViewCell.indicator)
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

        [searchBarView,
         jobButton,
         collectionView].forEach(view.addSubview(_:))
        
        
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchBarView.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: jobButton.topAnchor, constant: -10),

            jobButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            jobButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            jobButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
//MARK: - Create Layout
extension MainViewController {
    private func createLayout()-> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionsIndex]
            switch section {
            case .recommendations(_):
                return self.createSaleSection()
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
    
    
    private func createSaleSection()-> NSCollectionLayoutSection{
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 15,
                                          supplementaryItems: [],
                                          contentInsets: false)
        
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
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
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .recommendations(let sale): break
        case .vacancy(_):
            let item = collectionView.cellForItem(at: indexPath) as? JobCollectionViewCell
//            item.configure(data: <#T##Vacancy#>)
            self.navigationController?.pushViewController(DetailModul(), animated: true)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sections[indexPath.section] {
        case .recommendations(let sale):

            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HintCollectionViewCell.indicator, for: indexPath) as? HintCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(name: sale[indexPath.row].images)
            return cell
            
        case .vacancy( let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCollectionViewCell.indicator, for: indexPath) as? JobCollectionViewCell
            else {
                return UICollectionViewCell()
            }
//            let cell =
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
