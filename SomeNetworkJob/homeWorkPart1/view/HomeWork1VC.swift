//
//  HomeWork1VC.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import UIKit
import Combine

enum Section {
    case main
}

class HomeWork1VC: UIViewController {
    
    static let reuseIdentifier = "HomeWork1VC"
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, PersonInfo>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, PersonInfo>
    private var dataSource: DataSource!

    @IBOutlet var collectionView: UICollectionView!
    
    var subscriptions: Set<AnyCancellable> = []
    var viewModel: ViewModelHW1?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.titleLabel
        navigationController?.navigationBar.titleTextAttributes = viewModel?.attributesForTitle
        let part2NavButton = UIBarButtonItem(title: "_HW_part#2", style: .plain, target: self, action: #selector(nextScreenTapped(_:)))
        self.navigationItem.rightBarButtonItems = [part2NavButton]

        
        setUpDataSource()
        setData()
    }
    
    @objc func nextScreenTapped(_ sender: UITapGestureRecognizer) {
        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    
    
}

extension HomeWork1VC {
    func setData() {
        viewModel?.persons
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Retrieving data failed with error \(error)")
                }
            }, receiveValue: { persons in
                self.updateCollection(with: persons)
            })
            .store(in: &subscriptions)
    }
    
    func setUpDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
                print("Error in guard")
                return UICollectionViewCell()
            }
            cell.configureCell(viewModelString: itemIdentifier.name)
            return cell
        })
    }
    
    func updateCollection(with persons: [PersonInfo]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(persons)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}



