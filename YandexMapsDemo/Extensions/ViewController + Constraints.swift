//
//  ViewController + Constraints.swift
//  YandexMapsDemo
//
//  Created by Микаэл Мартиросян on 26.12.2022.
//

import UIKit

extension ViewController {
    
    func setupConstraints() {
        mapView.addSubview(confirmAddressButton)
        mapView.addSubview(pointImageView)
        mapView.addSubview(searchButton)
        mapView.addSubview(searchBar)
        mapView.addSubview(userLocationButton)
        mapView.addSubview(tableView)
        
        confirmAddressButtonConstraints()
        pointImageViewConstraints()
        searchButtonConstraints()
        searchBarConstraints()
        tableViewConstraints()
        userLocationButtonConstraints()
    }
    
    func confirmAddressButtonConstraints() {
        NSLayoutConstraint.activate([
            confirmAddressButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 40),
            confirmAddressButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -40),
            confirmAddressButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -50),
            confirmAddressButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func pointImageViewConstraints() {
        NSLayoutConstraint.activate([
            pointImageView.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            pointImageView.centerYAnchor.constraint(equalTo: mapView.centerYAnchor, constant: -(45/2)),
            pointImageView.heightAnchor.constraint(equalToConstant: 45),
            pointImageView.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func searchButtonConstraints() {
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 70),
            searchButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func searchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 70),
            searchBar.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            searchBar.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            tableViewHeightAnchor,
        ])
    }
    
    func userLocationButtonConstraints() {
        NSLayoutConstraint.activate([
            userLocationButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            userLocationButton.bottomAnchor.constraint(equalTo: confirmAddressButton.topAnchor, constant: -40),
            userLocationButton.heightAnchor.constraint(equalToConstant: 40),
            userLocationButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }    
}
