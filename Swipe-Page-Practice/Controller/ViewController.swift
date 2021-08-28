//
//  ViewController.swift
//  Swipe-Page-Practice
//
//  Created by ADMIN on 14/06/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let sliderItems = [
        UIView(),
        UIView(),
        UIView(),
        UIView()
    ]
    
    
    // MARK:- Configure CollectionView
    private let collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SliderCollectionViewCell.self,
        forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sliderItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.identifier,
                                                      for: indexPath) as! SliderCollectionViewCell
        let item = sliderItems[indexPath.item]
        
        switch indexPath.item {
        case 0: item.backgroundColor = .green
        case 1: item.backgroundColor = .gray
        case 2: item.backgroundColor = .yellow
        default: item.backgroundColor = .orange
        }

        cell.itemView = item
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        view.frame.size
    }
}
class SliderCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SliderCollectionViewCell"
    
    var itemView: UIView = {
        let itemView = UIView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        return itemView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        addSubview(itemView)
        
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: topAnchor),
            itemView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
