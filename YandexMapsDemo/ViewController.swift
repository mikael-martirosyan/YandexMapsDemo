//
//  ViewController.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 19.12.2022.
//

import UIKit
import YandexMapsMobile

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // Camera Position
    let startPoint = YMKPoint(latitude: 55.755827, longitude: 37.617697)

    // Search
    var searchManager: YMKSearchManager?
    var searchSession: YMKSearchSession?
    
    var searchObjectPoint: YMKPoint?
    var searchText: String?
    
    // Suggest
    var suggestResults: [YMKSuggestItem] = []
    var suggestSession: YMKSearchSuggestSession?
        
    let BOUNDING_BOX = YMKBoundingBox(
        southWest: YMKPoint(latitude: 55.55, longitude: 37.42),
        northEast: YMKPoint(latitude: 55.95, longitude: 37.82))
    let SUGGEST_OPTIONS = YMKSuggestOptions()
    
    // Timer
    var timer: Timer?
    
    // View
    @objc lazy var mapView: YMKMapView = {
        let view = YMKMapView(frame: view.bounds)
        return view
    }()
    
    // View Elements
    let confirmAddressButton = ConfirmAddressButton()
    let pointImageView = PointImageView(image: UIImage(named: "location"))
    let searchButton = SearchButton()
    let searchBar = UISearchBar()
    
    let tableView = DropTableView()
    let userLocationButton = UserLocationButton()

    lazy var tableViewHeightAnchor = tableView.heightAnchor.constraint(equalToConstant: .zero)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        
        // Установка позиции камеры (экрана) по стартовой точке (startPoint)
        mapView.mapWindow.map.move(with: YMKCameraPosition(target: startPoint, zoom: 15, azimuth: 0, tilt: 0),
                                   animationType: YMKAnimation(type: .linear, duration: 0),
                                   cameraCallback: nil)
        
        configurations()
        setupConstraints()
        suggestConfigurations()
    }
    
    // MARK: - Objc functions
    
    // Подтверждение выбора адреса
    @objc private func confirmAddressButtonTapped() {
        // Нахождение поинта текущей позиции камеры
        let target = mapView.mapWindow.map.cameraPosition.target
        
        guard let searchManager = searchManager else { return }
        
        // Нахождение адреса по заданной точке, сохранение и переход на следующий контроллер
        searchSession = searchManager.submit(with: target,
                                             zoom: 15,
                                             searchOptions: YMKSearchOptions()) { (searchResponse: YMKSearchResponse?, error: Error?) -> Void in
            if let response = searchResponse {
                let destinationVC = SecondViewController()
                destinationVC.addressLabel.text = response.collection.children.first?.obj?.name
                self.present(destinationVC, animated: true)
            }
        }
    }
    
    // Настройка элементов экрана для поиска адреса
    @objc private func searchButtonTapped() {
        if searchBar.isHidden == true {
            searchButton.isHidden = true
            searchBar.isHidden = false
            tableView.isHidden = false
        }
    }
    
    // Переход к точке локации пользователя (по умолчанию – startPoint)
    @objc private func userLocationButtonTapped() {
        mapView.mapWindow.map.move(with: YMKCameraPosition(target: startPoint, zoom: 15, azimuth: 0, tilt: 0),
                                   animationType: YMKAnimation(type: .smooth, duration: 2),
                                   cameraCallback: nil)
    }

    // MARK: - Functions
    
    @objc func hideKeyboard() {
        mapView.endEditing(true)
        tableView.isHidden = true
        searchBar.isHidden = true
        searchButton.isHidden = false
    }
    
    private func configurations() {
        confirmAddressButton.addTarget(self, action: #selector(confirmAddressButtonTapped), for: .touchUpInside)

        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        searchBar.delegate = self
        searchBar.isHidden = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.showsCancelButton = true
        searchBar.keyboardAppearance = .default
        searchBar.returnKeyType = .done
        
        tableView.dataSource = self
        tableView.delegate = self
        
        userLocationButton.addTarget(self, action: #selector(userLocationButtonTapped), for: .touchUpInside)
        
        searchManager = YMKSearch.sharedInstance().createSearchManager(with: .combined)
    }
    
    func alert() {
        let alert = UIAlertController(title: "Объект не найден", message: "Уточните адрес", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


#warning("Исправить")
extension ViewController: UITextFieldDelegate {
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        let suggestHandler = {(response: [YMKSuggestItem]?, error: Error?) -> Void in
//            if let items = response {
//                self.onSuggestResponse(items)
//            } else {
//                self.onSuggestError(error!)
//            }
//        }
//
//        suggestSession?.suggest(
//            withText: textField.text!,
//            window: BOUNDING_BOX,
//            suggestOptions: SUGGEST_OPTIONS,
//            responseHandler: suggestHandler)
//    }
        
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
            print("TextField did begin editing method called")
        }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
            print("TextField did end editing method called")
        }
        
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            print("TextField should begin editing method called")
        return true;
    }
        
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
            print("TextField should clear method called")
        return true;
        }
        
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            print("TextField should snd editing method called")
        return true;
        }
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print("While entering the characters this method gets called")
        return true;
        }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
        }
}
