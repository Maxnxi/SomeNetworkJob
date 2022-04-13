//
//  CollectionViewCell.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "CollectionViewCell"
    
    @IBOutlet var infoLabel: UILabel!
    
    func configureCell(viewModelString: String) {
        self.infoLabel.text = viewModelString
    }
    
}
