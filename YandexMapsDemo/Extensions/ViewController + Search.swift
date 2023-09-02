//
//  ViewController + Search.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit
import YandexMapsMobile

extension ViewController {
    
    // Получение ответа поиска
    func onSearchResponse(_ response: YMKSearchResponse) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        mapObjects.clear()
        
//        if let point = response.collection.children.first?.obj?.geometry.first?.point {
//            print("POINT \(point.latitude), \(point.longitude)")
//            searchObjectPoint = point
//        } else {
//            print("NO POINT")
//        }
        
        for searchResult in response.collection.children {
            print("SEARCH RESULT: \(searchResult.obj?.metadataContainer)")
            if let point = searchResult.obj?.geometry.first?.point {
                // Сохранение поинта выбранного объекта для перемещения к нему
                print("POINT \(point.latitude), \(point.longitude)")
                searchObjectPoint = point
            }
        }
    }
    
    // Обработка ошибки
    func onSearchError(_ error: Error) {
        guard let searchError = (error as NSError).userInfo[YRTUnderlyingErrorKey] as? YRTError else { return }
        var errorMessage = "Unknown error"
        if searchError.isKind(of: YRTNetworkError.self) {
            errorMessage = "Network error"
        } else if searchError.isKind(of: YRTRemoteError.self) {
            errorMessage = "Remote server error"
        }
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
