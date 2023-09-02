//
//  ViewController + Suggest.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit
import YandexMapsMobile

extension ViewController {
        
    func suggestConfigurations() {
        guard let searchManager = searchManager else { return }
        
        suggestSession = searchManager.createSuggestSession()
    }
    
    // Получение списка предложенных наименований объектов
    func onSuggestResponse(_ items: [YMKSuggestItem]) {
        // Сохранение списка предложенных наименований объектов
        suggestResults = items
        
        tableView.reloadData()
        
        // Изменение высоты tableView в зависимости от количества предложенных объектов
        tableViewHeightAnchor.constant = tableView.contentSize.height //50.0 * Double(suggestResults.count)
        tableView.layoutIfNeeded()
    }
    
    // Обработка ошибки
    func onSuggestError(_ error: Error) {
        guard let suggestError = (error as NSError).userInfo[YRTUnderlyingErrorKey] as? YRTError else { return }
        var errorMessage = "Unknown error"
        if suggestError.isKind(of: YRTNetworkError.self) {
            errorMessage = "Network error"
        } else if suggestError.isKind(of: YRTRemoteError.self) {
            errorMessage = "Remote server error"
        }
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
