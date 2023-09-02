//
//  ConfirmAddressButton.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

class ConfirmAddressButton: UIButton {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        clipsToBounds = true
        layer.cornerRadius = 25.0
        setTitle("Подтвердить адрес", for: .normal)
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
