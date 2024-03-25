import UIKit

class LoginVC: UIViewController {
    
    weak var loginCoordinator: LoginCoordinator?

    private lazy var labelSingIn: UILabel = {
        .configure(view: $0) { view in
            view.text = "Вход в личный кабинет"
            view.textColor = .white
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.backgroundColor = .clear
        }
    }(UILabel())
    
    private lazy var searchJobView: SearchJobView = {
        .configure(view: $0) { view in
            view.backgroundColor = AppColor.bgViewSearchJob
            view.layer.cornerRadius = 8
        }
    }(SearchJobView())
    
    private lazy var searchEmployee : SearchEmployee = {
        .configure(view: $0) { view in
            view.backgroundColor = AppColor.bgViewSearchJob
            view.layer.cornerRadius = 8
        }
    }(SearchEmployee())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        getSencVC()
    }
    
    func getSencVC(){
        searchJobView.continueButton.addTarget(self, action: #selector(sfwf), for: .touchUpInside)
    }
    @objc func sfwf(){
        loginCoordinator?.moveSendCodeVC()
    }
    
    private func setConstraint(){
        [labelSingIn,
         searchJobView,
         searchEmployee].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            labelSingIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelSingIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelSingIn.heightAnchor.constraint(equalToConstant: 20),

            searchJobView.topAnchor.constraint(equalTo: labelSingIn.bottomAnchor, constant: 144),
            searchJobView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchJobView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchJobView.heightAnchor.constraint(equalToConstant: 179),

            searchEmployee.topAnchor.constraint(equalTo: searchJobView.bottomAnchor, constant: 16),
            searchEmployee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchEmployee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchEmployee.heightAnchor.constraint(equalToConstant: 151),
        ])
    }
    
}
