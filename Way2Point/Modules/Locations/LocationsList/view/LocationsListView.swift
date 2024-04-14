import UIKit

//MARK: - Final class LocationsListView

final class LocationsListView: UIViewController {
    
    
//MARK: - Properties of class
    
    private var viewModel: LocationListViewModelProtocol
    
    private let tableView = UITableView()
    private let loadingProcessIndicator = UIActivityIndicatorView(style: .large)
    private var locations: [TheLocation] = []
    private var images: [[UIImage?]] = []

    
//MARK: - Initializators
    
    init(viewModel: LocationListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LocationsListTableViewCell.self, forCellReuseIdentifier: "LocationsTableViewCell")
        
        loadingProcessIndicator.center = view.center
        view.addSubviews(views: tableView, loadingProcessIndicator)

        constraintes()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        settingNavigationBar()
        
        showAlertBinding()
        updateDataBinding()
        loadingProcessIndicator.startAnimating()
        viewModel.loadData()
    }

    
//MARK: - Set navigation's bar options
    
    private func settingNavigationBar() {
        title = "locations"
        navigationController?.customColorsScheme()
    }
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }
    
    
//MARK: - Configure UI
    
    private func configureUI () {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        
        loadingProcessIndicator.hidesWhenStopped = true
    }
    
    
//MARK: - viewModel's bindings
    
    private func showAlertBinding() {
        viewModel.showNotificationsAlert = { [weak self] alert in
            self?.present(alert, animated: true)
            self?.loadingProcessIndicator.stopAnimating()
        }
    }
    
    private func updateDataBinding() {
        viewModel.updateData = { [weak self] locations, images in
            self?.locations = locations
            self?.images = images
            self?.tableView.reloadData()
            self?.loadingProcessIndicator.stopAnimating()
        }
    }
}


//MARK: Extentions for class LocationsListView [UITableViewDelegate, UITableViewDataSource]

extension LocationsListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = locations[indexPath.row]
        let number = indexPath.row + 1
        let currentImagesArray = images[indexPath.row]
        let image = currentImagesArray.first as? UIImage
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationsTableViewCell", for: indexPath) as? LocationsListTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.openCloseDescriptionSupport = { [weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.endUpdates()
        }
        
        cell.fetchLocation(by: number, for: location, image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetails(with: locations[indexPath.row], images[indexPath.row])
    }
}
