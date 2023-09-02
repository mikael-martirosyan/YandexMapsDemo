//
//  SearchButton.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

class SearchButton: UIButton {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray.withAlphaComponent(0.5)
        clipsToBounds = true
        layer.cornerRadius = 7.0
        setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
