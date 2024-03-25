import UIKit

class DetailModul: UIViewController {
    
    weak var ditaileCoordinator: DitaileCoordinator?
    
    ///Вычесляемое свойство для размера скрола
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentSize = contentSize
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())

    private lazy var nameJobLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "UI/UX Desiger"
            view.textColor = .white
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var salaryLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Уровень дохода не указан"
            view.textColor = .white
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var experienceLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Требуемый опыт: от 1 года до 3 лет"
            view.textColor = .white
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var closeLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Полная занятость"
            view.textColor = .white
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var textfieldStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.distribution = .fillProportionally
            stack.spacing = 10
            stack.backgroundColor = .clear
        }
    }(UIStackView())
    
    private lazy var responseLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "147 человек уже откликнулсь"
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = AppColor.buttonBG
            view.clipsToBounds = true
            view.textAlignment  = .center
            view.layer.cornerRadius = 8
        }
    }(UILabel())
    
    private lazy var loockLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "2 человека сейчас смотрит"
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = AppColor.buttonBG
            view.clipsToBounds = true
            view.textAlignment  = .center
            view.layer.cornerRadius = 8
        }
    }(UILabel())
    
    private lazy var mapView: MapView = {
        .configure(view: $0) { view in
            view.backgroundColor = .clear
        }
    }(MapView())
    
    private lazy var descriptionLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов."
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var yourTasksTitleLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Ваша задачи"
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 20, weight: .semibold)
        }
    }(UILabel())
    
    private lazy var yourTasksLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "-Проектировать пользовательский опыт, проводить UX исследования; -Разрабатывать адаптивный дизайн интерфейса для мобильных приложений; -Разрабатывать быстрые прототипы для тестирования идеи дизайна и их последующая; интеграция на основе обратной связи от команды и пользователей; -Взаимодействовать с командой разработчиков для обеспечения точной реализации ваших дизайнов; -Анализ пользовательского опыта и адаптация под тренды."
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var questionLabel: UILabel = {
        .configure(view: $0) { view in
            view.text = "Задайте вопрос работодателю"
            view.textColor = .white
            view.numberOfLines = 0
            view.font = .systemFont(ofSize: 14, weight: .semibold)
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
//        ditaileCoordinator?.moveSheetVC()
        let vc = SheetVC()
        vc.modalPresentationStyle = .formSheet
        let sheet = vc.sheetPresentationController
        let multiplier = 0.20
        let fraction = UISheetPresentationController.Detent.custom { context in
            self.view.frame.height / 3
        }
        sheet?.detents = [fraction]
        self.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        view.backgroundColor = AppColor.MainViewControllerBG
    }
    
    func configure(){
//        mapView.configure(vacancy: )
    }
    
    @objc func getSendResume(){
//        loginCoordinator?.moveSendCodeVC()
    }
    
    private func setConstraint(){
        [responseLabel,
         loockLabel].forEach(textfieldStack.addArrangedSubview(_:))
        
        
        [nameJobLabel,
         salaryLabel,
         experienceLabel,
         closeLabel,
         textfieldStack,
         mapView,
         descriptionLabel,
         yourTasksTitleLabel,
         yourTasksLabel,
         questionLabel
        ].forEach(scrollView.addSubview(_:))
        
        view.addSubview(scrollView)
        view.addSubview(conformButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: conformButton.topAnchor, constant: 16),
            
            nameJobLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            nameJobLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            nameJobLabel.heightAnchor.constraint(equalToConstant: 20),
            
            salaryLabel.topAnchor.constraint(equalTo: nameJobLabel.bottomAnchor, constant: 16),
            salaryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            salaryLabel.heightAnchor.constraint(equalToConstant: 20),
            
            experienceLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 16),
            experienceLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            experienceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            closeLabel.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 8),
            closeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            closeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            textfieldStack.topAnchor.constraint(equalTo: closeLabel.bottomAnchor, constant: 16),
            textfieldStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textfieldStack.heightAnchor.constraint(equalToConstant: 50),
            textfieldStack.widthAnchor.constraint(equalToConstant: 360),
            
            mapView.topAnchor.constraint(
                equalTo: textfieldStack.bottomAnchor, constant: 16),
            mapView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 150),
            mapView.widthAnchor.constraint(equalToConstant: view.bounds.width - 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 200),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 16),
        
            yourTasksTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            yourTasksTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            yourTasksTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            yourTasksLabel.topAnchor.constraint(equalTo: yourTasksTitleLabel.bottomAnchor, constant: 16),
            yourTasksLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            yourTasksLabel.heightAnchor.constraint(equalToConstant: 200),
            yourTasksLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 16),
            
            questionLabel.topAnchor.constraint(equalTo: yourTasksLabel.bottomAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            questionLabel.heightAnchor.constraint(equalToConstant: 20),
                     
            conformButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conformButton.heightAnchor.constraint(equalToConstant: 50),
            conformButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 16),
            conformButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
