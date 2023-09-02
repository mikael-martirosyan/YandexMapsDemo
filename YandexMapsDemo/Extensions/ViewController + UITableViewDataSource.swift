//
//  ViewController + UITableViewDataSource.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit
import YandexMapsMobile

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("RESULTS COUNT: \(suggestResults.count)")
        return suggestResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SuggestCell.reuseID, for: indexPath) as? SuggestCell else { return UITableViewCell() }
        
        let type = suggestResults[indexPath.row].type
        
        print("DATA SOURCE/n Item: \(suggestResults[indexPath.row]), Index: \(indexPath.row)")
                
        print("Display Text: \(suggestResults[indexPath.row].displayText)")
        print("Search Text: \(suggestResults[indexPath.row].searchText)")
        print("Title: \(suggestResults[indexPath.row].title.text)")
        print("Subtitle: \(suggestResults[indexPath.row].subtitle?.text)")
        switch type {
        case .transit:
            print("Type: Transit")
        case .business:
            print("Type: Business")
        case .toponym:
            print("Type: Toponym")
        case .unknown:
            print("Type: Unknown")
        default:
            print("Type: Default")
        }
        print("URI: \(suggestResults[indexPath.row].uri)")
        print("______________\n\n")
        
        switch type {
        case .toponym:
            cell.itemNameLabel.text = suggestResults[indexPath.row].title.text
            cell.streetNameLabel.text = suggestResults[indexPath.row].subtitle?.text ?? "NO SUBTITLE TEXT"
        case .business:
            cell.itemNameLabel.text = suggestResults[indexPath.row].displayText
            cell.streetNameLabel.text = suggestResults[indexPath.row].subtitle?.text ?? "NO SUBTITLE TEXT"
        case .transit:
            print("Transit")
        case .unknown:
            print("Unknown")
        default:
            break
//            cell.itemNameLabel.text = suggestResults[indexPath.row].title.text
//            cell.streetNameLabel.text = suggestResults[indexPath.row].searchText
        }
        
        return cell
    }
}


#warning("ДОДЕЛАТЬ:")
/*
 1. Подстваить в itemTitleLabel нужный параметр в зависимости от типа. Неверный поиск при передачи только по title, так как при одинаковых названиях компаний, метка может выбрать неправильный адрес (32 дент) !!!!!!!!!!!!
 2. Исправить проблему, когда при нажатии на разные ячейки метка меняется между двумя точками !!!!!!!!!!!!!
 3. Изменить метку
 4. Доделать кнопку отмены
 5. Разобраться с методом onSearchResponse и понять что кладется в searchObjectPoint !!!!!!!!!!!!!!
 
*/
