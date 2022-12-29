//
//  SuggestCell.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

class SuggestCell: UITableViewCell {
    
    // MARK: - Properties
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let streetNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let reuseID = "SuggestCell"
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupConstraints() {
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(streetNameLabel)
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            itemNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0)
        ])
        
        NSLayoutConstraint.activate([
            streetNameLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor),
            streetNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
            streetNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            streetNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0)
        ])
    }
}
