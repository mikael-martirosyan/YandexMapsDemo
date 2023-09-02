//
//  PointImageView.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

class PointImageView: UIImageView {
    
    // MARK: - Life Cycle
    
    override init(image: UIImage?) {
        super.init(image: image)
        
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
