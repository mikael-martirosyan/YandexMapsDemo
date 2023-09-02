//
//  ViewController + UITableViewDelegate.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit
import YandexMapsMobile

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let suggestResults = suggestResults[indexPath.row]
        
        print("DELEGATE\n Item: \(suggestResults), Index: \(indexPath.row), address: \(suggestResults.searchText), \(suggestResults.subtitle?.text)")
        
        #warning("Проблема")
//        guard let displayText = suggestResults[indexPath.row].displayText else { return }
        // Сохранение наименования выбранного из списка объекта для получения его поинта
        let type = suggestResults.type
        switch type {
        case .toponym:
            searchText = suggestResults.searchText
            searchBar.text = suggestResults.title.text // Проверить работу displayText
        case .unknown:
            fatalError()
        case .business:
            searchText = suggestResults.searchText
            searchBar.text = suggestResults.title.text // Проверить работу displayText
        case .transit:
            fatalError()
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.isHidden = true
        searchBar.endEditing(true)
        
        guard let searchManager = searchManager else { return }
        guard let searchText = searchText else { return }
        
        // Замыкание для следующего метода submit
        let responseHandler = { (searchResponse: YMKSearchResponse?, error: Error?) -> Void in
            if let response = searchResponse {
                // Получение поинта объекта
                
                self.onSearchResponse(response)
                
                if let searchObjectPoint = self.searchObjectPoint {
                    
                    print("Search Object Point\n lat: \(searchObjectPoint.latitude), long: \(searchObjectPoint.longitude)")
                    // Переход на полученный поинт
                    self.mapView.mapWindow.map.move(with: YMKCameraPosition(target: searchObjectPoint,
                                                                            zoom: 17,
                                                                            azimuth: 0,
                                                                            tilt: 0),
                                                    animationType: YMKAnimation(type: .smooth,
                                                                                duration: 2),
                                                    cameraCallback: nil)
                } else {
                    // Вызов алерта, если не удалось получить поинт объекта
                    self.alert()
                }
            } else if let error = error {
                // Обработка ошибки
                self.onSearchError(error)
            }
        }
        
        // Передача наименования объекта для получения поинта и перехода на него
        searchSession = searchManager.submit(withText: searchText,
                                             geometry: YMKVisibleRegionUtils.toPolygon(with: mapView.mapWindow.map.visibleRegion),
                                             searchOptions: YMKSearchOptions(),
                                             responseHandler: responseHandler)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


/*
 
 
 
 
 */
