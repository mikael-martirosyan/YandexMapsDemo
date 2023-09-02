//
//  KeyboardExtension.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

//extension ViewController {
//
//    // Когда клавиатура появляется
//    @objc func keyboardWasShown(notification: Notification) {
//
//        // Получаем размер клавиатуры
//        let info = notification.userInfo! as NSDictionary
//        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
//
//        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
//        self.mapView.contentInset = contentInsets
//        scrollView?.scrollIndicatorInsets = contentInsets
//    }
//
//    //Когда клавиатура исчезает
//    @objc func keyboardWillBeHidden(notification: Notification) {
//        // Устанавливаем отступ внизу UIScrollView, равный 0
//        let contentInsets = UIEdgeInsets.zero
//        scrollView?.contentInset = contentInsets
//    }
//
//    @objc func hideKeyboard() {
////            self.scrollView?.endEditing(true)
//        mapView.endEditing(true)
//    }
//}
