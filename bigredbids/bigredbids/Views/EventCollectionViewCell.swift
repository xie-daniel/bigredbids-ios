//
//  EventCollectionViewCell.swift
//  A4
//
//  Created by Byounghyun Lee on 2023/11/11.
//

import UIKit
import SDWebImage

class EventCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let eventImage = UIImageView()
    private let eventName = UILabel()
    private let dateLabel = UILabel()
    private let highestBidLabel = UILabel()
    
    // MARK: - Properties (data)
    
    private var food: Event!
    
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
        setupDate()
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
        
        contentView.addSubview(eventName)
        eventName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 8),
            eventName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            eventName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDate() {
        dateLabel.font = .systemFont(ofSize: 12).rounded
        dateLabel.textColor = .gray
        
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupHighestBid() {
        highestBidLabel.font = .systemFont(ofSize: 14, weight: .semibold).rounded
        highestBidLabel.textColor = .black
        
        contentView.addSubview(highestBidLabel)
        highestBidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highestBidLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            highestBidLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            highestBidLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    
    // MARK: - Button Helpers
    
    func configure(with food: Event) {
        eventImage.sd_setImage(with: URL(string: food.imageUrl))
        eventName.text = food.name
        dateLabel.text = "\(food.rating) ∙ \(food.difficulty)"
        highestBidLabel.text = "Highest bid: " + "(data)"
        self.food = food
    }
    
    
    
}
