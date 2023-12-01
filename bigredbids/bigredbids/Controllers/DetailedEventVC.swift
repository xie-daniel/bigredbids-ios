//
//  DetailedEventVC.swift
//  bigredbids
//
//  Created by Byounghyun Lee on 2023/11/11.
//

import UIKit

class DetailedEventVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let eventImage = UIImageView()
    private let eventNameLabel = UILabel()
    private let eventDescriptionLabel = UILabel()
    private let highestBidLabel = UILabel()
    private let startingBidLabel = UILabel()
    private let detailsTitleLabel = UILabel()
    private let dateLabel = UILabel()
    private let bidButton = UIButton()
    
    // MARK: - Properties (data)
    
    var event: Event!
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.brb.white
        navigationController?.navigationBar.topItem?.backButtonTitle = "Events"
        setupEventImage()
        setupEventNameLabel()
        setupDateLabel()
        setupHighestBidLabel()
        setupStartingBidLabel()
        setupDetailsTitleLabel()
        setupEventDescriptionLabel()
        setupBidButton()
    }
    
    private func setupEventImage() {
        eventImage.layer.cornerRadius = 12
        eventImage.clipsToBounds = true
        eventImage.contentMode = .scaleAspectFill
        
        view.addSubview(eventImage)
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 99),
            eventImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            eventImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            eventImage.heightAnchor.constraint(equalToConstant: 150),
            eventImage.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    private func setupEventNameLabel() {
        eventNameLabel.numberOfLines = 2
        eventNameLabel.font = .systemFont(ofSize: 24, weight: .semibold).rounded
        eventNameLabel.textColor = .black
        
        view.addSubview(eventNameLabel)
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventNameLabel.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 32),
            eventNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            eventNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupDateLabel() {
        dateLabel.font = .systemFont(ofSize: 15).rounded
        dateLabel.textColor = .gray
        
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupHighestBidLabel() {
        highestBidLabel.font = .systemFont(ofSize: 15, weight: .semibold).rounded
        highestBidLabel.textColor = UIColor.brb.crimson
        
        view.addSubview(highestBidLabel)
        highestBidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highestBidLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            highestBidLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            highestBidLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupStartingBidLabel() {
        startingBidLabel.font = .systemFont(ofSize: 15).rounded
        startingBidLabel.textColor = UIColor.brb.black
        
        view.addSubview(startingBidLabel)
        startingBidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startingBidLabel.topAnchor.constraint(equalTo: highestBidLabel.bottomAnchor, constant: 3),
            startingBidLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startingBidLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupDetailsTitleLabel() {
        detailsTitleLabel.font = .systemFont(ofSize: 18, weight: .semibold).rounded
        detailsTitleLabel.textColor = UIColor.brb.black
        
        view.addSubview(detailsTitleLabel)
        detailsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailsTitleLabel.topAnchor.constraint(equalTo: startingBidLabel.bottomAnchor, constant: 15),
            detailsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            detailsTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupEventDescriptionLabel() {
        eventDescriptionLabel.numberOfLines = 100
        eventDescriptionLabel.font = .systemFont(ofSize: 14).rounded
        eventDescriptionLabel.textColor = .black
        
        view.addSubview(eventDescriptionLabel)
        eventDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventDescriptionLabel.topAnchor.constraint(equalTo: detailsTitleLabel.bottomAnchor, constant: 5),
            eventDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            eventDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupBidButton() {
        bidButton.backgroundColor = UIColor.brb.crimson
        bidButton.layer.cornerRadius = 4
        bidButton.setTitle("Place a bid", for: .normal)
        bidButton.setTitleColor(UIColor.brb.white, for: .normal)
        bidButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        bidButton.addTarget(self, action: #selector(createBid), for: .touchUpInside)
        
        view.addSubview(bidButton)
        bidButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bidButton.topAnchor.constraint(equalTo: eventDescriptionLabel.bottomAnchor, constant: 15),
            bidButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bidButton.widthAnchor.constraint(equalToConstant: 96),
            bidButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    
    // MARK: - configure
    
    func configure(with event: Event) {
        if (event.title.contains("Hockey") || event.title.contains("hockey")) {
            eventImage.image = UIImage(named:"Hockey")
        } else if (event.title.contains("Concert") || event.title.contains("concert")) {
            eventImage.image = UIImage(named:"Concert")
        } else if (event.title.contains("Show") || event.title.contains("show")) {
            eventImage.image = UIImage(named:"Show")
        } else if (event.title.contains("Football") || event.title.contains("football")) {
            eventImage.image = UIImage(named:"Football")
        } else {
            eventImage.image = UIImage(named:"Default")
        }
        eventNameLabel.text = event.title
        eventDescriptionLabel.text = event.description
        highestBidLabel.text = "Highest bid: " + "(data)"
        startingBidLabel.text = "Starting bid: " + "(data)"
        dateLabel.text = "(i.e. Nov 11 2023)"
        detailsTitleLabel.text = "Details"
        self.event = event
    }
    
    // MARK: - Button Helpers
    
    @objc private func createBid() {
        // TODO: Send a POST request to place a bid
        
        
    }
    
}
