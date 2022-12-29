//
//  SecondViewController.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 27.12.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Properties
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addressLabel.heightAnchor.constraint(equalToConstant: 40),
            addressLabel.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
}
