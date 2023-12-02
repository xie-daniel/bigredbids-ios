//
//  CreateEventVC.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/30/23.
//

import Foundation
import UIKit

class CreateEventVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let nameLabel = UILabel()
    private let nameField = UITextField()
    private let dateLabel = UILabel()
    private let dateField = UITextField()
    private let startingBidLabel = UILabel()
    private let startingBidField = UITextField()
    private let descriptionLabel = UILabel()
    private let descriptionField = UITextView()
    private let createAuctionButton = UIButton()
    private let invalidBidText = UILabel()
    private let invalidNameDateLabel = UILabel()
    
    // MARK: - Properties (data)
    
    private var userID: Int
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Auction"
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.brb.red]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.topItem?.backButtonTitle = "Events"
        view.backgroundColor = UIColor.brb.white
        
        setupNameLabel()
        setupNameField()
        setupDateLabel()
        setupDateField()
        setupStartingBidLabel()
        setupStartingBidField()
        setupDescriptionLabel()
        setupDescriptionField()
        setupCreateAuctionButton()
        
    }
    
    init (id: Int) {
        userID = id
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    
    private func setupNameLabel() {
        nameLabel.text = "Event Name"
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 168)
        ])
    }
    private func setupNameField() {
        nameField.placeholder = "Enter event name..."
        nameField.borderStyle = .roundedRect
        nameField.autocapitalizationType = .none
        nameField.autocorrectionType = .no
        nameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameField)
        
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupDateLabel() {
        dateLabel.text = "Event Date"
        dateLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupDateField() {
        dateField.placeholder = "Enter event date..."
        dateField.borderStyle = .roundedRect
        dateField.autocapitalizationType = .none
        dateField.autocorrectionType = .no
        dateField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateField)
        
        NSLayoutConstraint.activate([
            dateField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            dateField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            dateField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupStartingBidLabel() {
        startingBidLabel.text = "Starting Bid   $"
        startingBidLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        startingBidLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startingBidLabel)
        
        NSLayoutConstraint.activate([
            startingBidLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            startingBidLabel.topAnchor.constraint(equalTo: dateField.bottomAnchor, constant: 24)
        ])
    }
    
    private func setupStartingBidField() {
        startingBidField.placeholder = "Enter starting bid..."
        startingBidField.borderStyle = .roundedRect
        startingBidField.autocapitalizationType = .none
        startingBidField.autocorrectionType = .no
        startingBidField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startingBidField)
        
        NSLayoutConstraint.activate([
            startingBidField.leadingAnchor.constraint(equalTo: startingBidLabel.trailingAnchor),
            startingBidField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            startingBidField.centerYAnchor.constraint(equalTo: startingBidLabel.centerYAnchor)
        ])
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = "Description"
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: startingBidField.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupDescriptionField() {
        descriptionField.font = .systemFont(ofSize: 17)
        descriptionField.layer.cornerRadius = 5
        descriptionField.layer.borderColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1).cgColor
        descriptionField.layer.borderWidth = 1
        descriptionField.autocapitalizationType = .none
        descriptionField.autocorrectionType = .no
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionField)
        
        NSLayoutConstraint.activate([
            descriptionField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionField.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            descriptionField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            descriptionField.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    private func setupCreateAuctionButton() {
        createAuctionButton.backgroundColor = UIColor.brb.red
        createAuctionButton.layer.cornerRadius = 24
        createAuctionButton.setTitle("Create Auction", for: .normal)
        createAuctionButton.setTitleColor(UIColor.brb.white, for: .normal)
        createAuctionButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        createAuctionButton.addTarget(self, action: #selector(createAuction), for: .touchUpInside)
        
        view.addSubview(createAuctionButton)
        createAuctionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createAuctionButton.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 24),
            createAuctionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAuctionButton.widthAnchor.constraint(equalToConstant: 224),
            createAuctionButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setupInvalidBid() {
        invalidBidText.text = "Invalid bid: must be non-negative integer"
        invalidBidText.font = .systemFont(ofSize: 12, weight: .regular)
        invalidBidText.textColor = UIColor.red
        
        invalidBidText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(invalidBidText)
        
        NSLayoutConstraint.activate([
            invalidBidText.leadingAnchor.constraint(equalTo: startingBidField.leadingAnchor),
            invalidBidText.topAnchor.constraint(equalTo: startingBidField.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupInvalidNameDate() {
        invalidNameDateLabel.text = "Please provide name and date for the event"
        invalidNameDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        invalidNameDateLabel.textColor = UIColor.red
        
        invalidNameDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(invalidNameDateLabel)
        
        NSLayoutConstraint.activate([
            invalidNameDateLabel.centerXAnchor.constraint(equalTo: createAuctionButton.centerXAnchor),
            invalidNameDateLabel.topAnchor.constraint(equalTo: createAuctionButton.bottomAnchor, constant: 8)
        ])
    }
    
    // MARK: - Button helpers
    
    @objc func createAuction() {
        
        if let startingBid = Int(startingBidField.text ?? "e") {
            if (startingBid >= 0) {
                if (nameField.text != "" && dateField.text != "") {
                    NetworkManager.shared.createAuction(name: nameField.text ?? "Default", date: dateField.text ?? "Default", startingBid: startingBid, description: descriptionField.text ?? "", userId: userID) { [weak self] success in
                        guard let self = self else { return }
                        navigationController?.popViewController(animated: true)
                    }
                } else {
                    setupInvalidNameDate()
                }
            } else {
                setupInvalidBid()
            }
        } else {
            setupInvalidBid()
        }
        
    }
}
