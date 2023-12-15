import UIKit

//MARK: - Final class LocationsViewController

final class LocationsViewController: UIViewController {
    
    
//MARK: - Properties of class
    
    private let tableView = UITableView()

    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        
        view.addSubview(tableView)
//
        constraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.customColorsScheme() 
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    }
    
    
    
//MARK: - Configure UI
    
    private func configureUI () {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        
    }
}



//MARK: Extentions for class LocationsViewController [UITableViewDelegate, UITableViewDataSource]

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "some")
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    
}
