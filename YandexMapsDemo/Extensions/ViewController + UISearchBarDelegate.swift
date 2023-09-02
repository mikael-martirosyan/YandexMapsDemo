//
//  ViewController + UISearchBarDelegate.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 27.12.2022.
//

import UIKit
import YandexMapsMobile

extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if !searchText.isEmpty {
            // Установка таймера для задержки запроса при поиске объекта. Экономит трафик пользователя и количество запросов к API
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                guard let suggestSession = self.suggestSession else { return }
                
                // Замыкание для следующего метода suggest
                let suggestHandler = { (items: [YMKSuggestItem]?, error: Error?) -> Void in
                    if let items = items {
                        // Получение списка предложенных наименований объектов
                        self.onSuggestResponse(items)
                    } else if let error = error {
                        // Обработка ошибки
                        self.onSuggestError(error)
                    }
                }
                
                // Передача набранного в поисковой строке текста для получения предложенных наименований объектов
                suggestSession.suggest(withText: searchText,
                                       window: self.BOUNDING_BOX,
                                       suggestOptions: self.SUGGEST_OPTIONS,
                                       responseHandler: suggestHandler)
            }
//        } else if searchText == "" {
////            mapView.endEditing(true)
////            self.searchBar.isHidden = true
////            searchButton.isHidden = false
//            tableView.isHidden = true
//            suggestResults = []
//        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Обнуление текста в поисковой строке
//        searchBar.text = ""
//        mapView.endEditing(true)
        self.searchBar.isHidden = true
        searchButton.isHidden = false
        tableView.isHidden = true
        // Обнуление списка предложенных наименований объектов
        suggestResults = []
    }
}
