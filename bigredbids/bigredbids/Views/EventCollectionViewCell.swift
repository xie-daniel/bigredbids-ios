//
//  EventCollectionViewCell.swift
//  bigredbids
//
//  Created by Byounghyun Lee on 2023/11/11.
//

import UIKit
import SDWebImage

class EventCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let eventImage = UIImageView()
    private let eventName = UILabel()
    private let dateIcon = UIImageView()
    private let dateLabel = UILabel()
    private let dollarSignImage = UIImageView()
    private let highestBidLabel = UILabel()
    private let yourBidLabel = UILabel()
    
    // MARK: - Properties (data)
    
    private var event: Event!
    private var userId: Int!
    
    static let reuse: String = "EventCollectionViewCellReuse"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.brb.white
        layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.45).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width:0, height:3)
        
        setupEventImage()
        setupEventName()
        setupDateIcon()
        setupDate()
        setupDollarSign()
        setupHighestBid()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - set up views
    
    private func setupEventImage() {
        eventImage.layer.cornerRadius = 12
        eventImage.clipsToBounds = true
        eventImage.contentMode = .scaleAspectFill
        
        contentView.addSubview(eventImage)
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImage.heightAnchor.constraint(equalToConstant: 148),
            eventImage.widthAnchor.constraint(equalToConstant: 360)
        ])
    }
    
    private func setupEventName() {
        eventName.numberOfLines = 3
        eventName.font = .systemFont(ofSize: 18, weight: .semibold).rounded
        eventName.textColor = .black
        eventName.numberOfLines = 1
        
        contentView.addSubview(eventName)
        eventName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 8),
            eventName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            eventName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDateIcon() {
        dateIcon.image = UIImage(named:"CalendarBlack")
        contentView.addSubview(dateIcon)
        dateIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateIcon.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 6),
            dateIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dateIcon.heightAnchor.constraint(equalToConstant: 20),
            dateIcon.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupDate() {
        dateLabel.font = .systemFont(ofSize: 14, weight: .semibold).rounded
        dateLabel.textColor = .gray
        
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: dateIcon.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dateIcon.trailingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupDollarSign() {
        dollarSignImage.image = UIImage(named: "DollarSign")
        
        contentView.addSubview(dollarSignImage)
        dollarSignImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dollarSignImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            dollarSignImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dollarSignImage.heightAnchor.constraint(equalToConstant: 20),
            dollarSignImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupHighestBid() {
        highestBidLabel.font = .systemFont(ofSize: 14, weight: .semibold).rounded
        highestBidLabel.textColor = .black
        
        contentView.addSubview(highestBidLabel)
        highestBidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highestBidLabel.centerYAnchor.constraint(equalTo: dollarSignImage.centerYAnchor),
            highestBidLabel.leadingAnchor.constraint(equalTo: dollarSignImage.trailingAnchor, constant: 8),
            highestBidLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupYourBid() {
        yourBidLabel.text = "Your bid is "
        
    }

    
    // MARK: - Button Helpers
    
    func configure(with event: Event, id: Int) {
        
        self.userId = id
        self.event = event
        
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
        
        if (event.bids.contains(userId)) {
            setupYourBid()
        }
        
        eventName.text = event.title
        dateLabel.text = "\(event.date)"
        
        if (event.bids.count == 0) {
            highestBidLabel.text = "Highest bid: No bidders!"
        } else {
            highestBidLabel.text = "Highest bid: $\(event.highestBid)"
        }
    }
    
    
    
}
