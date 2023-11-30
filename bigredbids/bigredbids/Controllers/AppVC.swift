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
    private var createEventButton = UIButton()
    private var createButtonLabel = UILabel()
    private let refresh = UIRefreshControl()
    
    // MARK: - Properties (data)
    
    private let filters = ["Events", "My Bids", "My Listings"]
    private var selectedFilterIndex: Int = 0
    private var user_id: Int
    private var events: [Event] = Event.dummyData
    private var filteredEvents: [Event] = Event.dummyData

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Big Red Bids"
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.brb.red]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.topItem?.backButtonTitle = "Logout"
        navigationController?.navigationBar.tintColor = UIColor.brb.red
        view.backgroundColor = UIColor.brb.white
        
        setupFilterCollectionView()
        setupEventCollectionView()
        updateEventCollectionView(with: events)
        setupCreateEventButton()
        setupCreateButtonLabel()
        //getData()
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
        NetworkManager.shared.fetchData{ [weak self] events in
            guard let self = self else { return }
            self.events = events
            self.filteredEvents = events
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
            filterCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupEventCollectionView() {
        let eventlayout = UICollectionViewFlowLayout()
        eventlayout.scrollDirection = .vertical
        eventlayout.minimumLineSpacing = 20
        
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
            eventCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            eventCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            eventCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCreateEventButton() {
        createEventButton.layer.cornerRadius = 32
        createEventButton.backgroundColor = UIColor.brb.red
        createEventButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        createEventButton.layer.shadowOpacity = 1
        createEventButton.layer.shadowRadius = 5
        createEventButton.layer.shadowOffset = CGSize(width:2, height:2)
        createEventButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createEventButton)
        
        NSLayoutConstraint.activate([
            createEventButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            createEventButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            createEventButton.heightAnchor.constraint(equalToConstant: 64),
            createEventButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        createEventButton.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        
    }
    
    private func setupCreateButtonLabel() {
        createButtonLabel.text = "+"
        createButtonLabel.font = .systemFont(ofSize: 50, weight: .medium).rounded
        createButtonLabel.textColor = UIColor.brb.white
        createButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createButtonLabel)
        
        NSLayoutConstraint.activate([
            createButtonLabel.centerXAnchor.constraint(equalTo: createEventButton.centerXAnchor),
            createButtonLabel.centerYAnchor.constraint(equalTo: createEventButton.centerYAnchor, constant: -4)
        ])
        
    }
    
    
    // MARK: - filtering
    
    private func updateEventCollectionView(with events: [Event]) {
        self.events = events
        eventCollectionView.reloadData()
    }
    
    // MARK: - helper functions
    
    private func applyFilter(at index: Int) {
        selectedFilterIndex = index
        filterCollectionView.reloadData()
        updateEventCollectionView(with: filteredEvents)
    }
    
    @objc private func createEvent() {
        let createVC = CreateEventVC(id: user_id)
        navigationController?.pushViewController(createVC, animated: true)
    }

}

// MARK: - UICollectionViewDelegate

extension AppVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            let selectedFilter = filters[indexPath.row]
            selectedFilterIndex = indexPath.row
            if indexPath.row == 0 {
                filteredEvents = events
            } else {
                filteredEvents = events.filter{ $0.difficulty == selectedFilter }
            }
            filterCollectionView.reloadData()
            eventCollectionView.reloadData()
        } else {
            let selectedRecipe = filteredEvents[indexPath.item]
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
            return filteredEvents.count
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
            let event = filteredEvents[indexPath.item]
            cell.configure(with: event)
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
            return CGSize(width: size, height: 236)
        }
    }
    
}
