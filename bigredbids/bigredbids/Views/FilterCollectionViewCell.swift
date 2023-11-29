//
//  FilterCollectionViewCell.swift
//  A4
//
//  Created by Byounghyun Lee on 2023/11/12.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let filterButton = UIButton()
    private let filterImage = UIImageView()
    
    // MARK: - Properties (data)
    private var filter: String!
    
    static let reuse: String = "FilterCollectionViewCellReuse"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupFilterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set up views
    
    private func setupFilterButton() {
        filterButton.setTitleColor(.white, for: .normal)
        filterButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold).rounded
        filterButton.backgroundColor = UIColor.brb.red
        filterButton.layer.masksToBounds = true
        filterButton.clipsToBounds = true
        filterButton.layoutIfNeeded()
        filterButton.layer.cornerRadius = 1
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        filterButton.isUserInteractionEnabled = false
        
        contentView.addSubview(filterButton)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterButton.heightAnchor.constraint(equalToConstant: 50),
            filterButton.widthAnchor.constraint(equalToConstant: 80),
            filterButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 28),
        ])
        
    }
    
    private func setupFilterImage() {
        filterImage.image = UIImage(named: filter)
        
        filterImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(filterImage)
        
        NSLayoutConstraint.activate([
            filterImage.heightAnchor.constraint(equalToConstant: filterImage.image?.size.height ?? 40),
            filterImage.widthAnchor.constraint(equalToConstant: filterImage.image?.size.width ?? 40),
            filterImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
    // MARK: - Button Helpers
    
    @objc private func filterButtonTapped() {
        //isSelected = !isSelected
        //configure(with: filter, isselected: true, firstConfigure: false)
    }
    
    // MARK: - Configure
    
    func configure(with filter: String, isselected: Bool) {
        self.filter = filter
        filterButton.setTitle(filter, for: .normal)
        setupFilterImage()
        if (isselected) {
            filterButton.setTitleColor(.white, for: .normal)
        } else {
            filterButton.setTitleColor(UIColor.brb.lightGray, for: .normal)
            filterImage.image = UIImage(named: "\(filter)Gray")
        }
    }
    
    func changeButtonColor(selected: Bool) {
        if (selected) {
            filterButton.setTitleColor(.white, for: .normal)
        } else {
            filterButton.setTitleColor(UIColor.brb.lightGray, for: .normal)
        }
    }
}
