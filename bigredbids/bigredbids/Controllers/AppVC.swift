//
//  AppVC.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/28/23.
//

import Foundation
import UIKit

class AppVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private var eventCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    private let refresh = UIRefreshControl()
    
    // MARK: - Properties (data)
    
    private let filters = ["Events", "My Bids", "My Listing"]
    private var selectedFilterIndex: Int!
    private var user_id: Int
    private var food: [Food] = []
    private var filteredRecipes: [Food] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Big Red Bids"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.brb.white
        
        setupFilterCollectionView()
        setupEventCollectionView()
        updateEventCollectionView(with: food)
        getData()
    }
    
    init (id: Int) {
        user_id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Networking
    
    @objc private func getData() {
        NetworkManager.shared.fetchData{ [weak self] food in
            guard let self = self else { return }
            self.food = food
            self.filteredRecipes = food
            self.eventCollectionView.reloadData()
            self.refresh.endRefreshing()
            
        }
    }
    
    // MARK: - Set up Views
    
    private func setupFilterCollectionView() {
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = UIColor.brb.red
        
        // Set up CollectionView
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuse)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        
        view.addSubview(filterCollectionView)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupEventCollectionView() {
        let eventlayout = UICollectionViewFlowLayout()
        eventlayout.scrollDirection = .vertical
        eventCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: eventlayout)
        eventCollectionView.backgroundColor = UIColor.brb.white
        
        // Set Up CollectionView
        eventCollectionView.alwaysBounceVertical = true
        eventCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.reuse)
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
        
        view.addSubview(eventCollectionView)
        eventCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        refresh.addTarget(self, action: #selector(getData), for: .valueChanged)
        eventCollectionView.refreshControl = refresh
        
        NSLayoutConstraint.activate([
            eventCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            eventCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            eventCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    
    // MARK: - filtering
    
    private func updateEventCollectionView(with recipes: [Food]) {
        food = recipes
        eventCollectionView.reloadData()
    }
    
    // MARK: - helper functions
    
    private func applyFilter(at index: Int) {
        selectedFilterIndex = index
        filterCollectionView.reloadData()
        updateEventCollectionView(with: filteredRecipes)
    }

}

// MARK: - UICollectionViewDelegate

extension AppVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            let selectedFilter = filters[indexPath.row]
            selectedFilterIndex = indexPath.row
            if indexPath.row == 0 {
                filteredRecipes = food
            } else {
                filteredRecipes = food.filter{ $0.difficulty == selectedFilter }
            }
            filterCollectionView.reloadData()
            eventCollectionView.reloadData()
            } else {
                let selectedRecipe = food[indexPath.item]
                let detailViewController = DetailedEventVC()
                detailViewController.configure(with: selectedRecipe)
                navigationController?.pushViewController(detailViewController, animated: true)
            }
        
    }
}



// MARK: - UICollectionViewDataSource

extension AppVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView {
            return filters.count
        } else {
            return filteredRecipes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cells for each section
        
        if collectionView == filterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuse, for: indexPath) as! FilterCollectionViewCell
                    let filter = filters[indexPath.item]
                    let isSelected = indexPath.item == selectedFilterIndex
            cell.configure(with: filter, isselected: isSelected)
                    return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reuse, for: indexPath) as! EventCollectionViewCell
            let recipe = filteredRecipes[indexPath.item]
            cell.configure(with: recipe)
            return cell
        }

    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // the size for each cell per section
        if (collectionView == self.filterCollectionView) {
            return CGSize(width: (collectionView.frame.width - 32) / 3, height: 250)
        } else {
            let size = collectionView.frame.width
            return CGSize(width: size, height: 250)
        }
    }
    
}
