//
//  SearchTextField.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

class SearchTextField: UITextField {

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true
        isHidden = true
        layer.cornerRadius = 7.0
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        leftView = view
        leftViewMode = .always
        placeholder = "Введите улицу и номер дома"
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


