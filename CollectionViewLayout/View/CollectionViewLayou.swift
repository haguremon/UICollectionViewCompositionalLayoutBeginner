//
//  CollectionViewLayou.swift
//  CollectionViewLayout
//
//  Created by IwasakIYuta on 2021/08/02.
//

import Foundation
import UIKit
class CollectionViewLayout {
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: .init(
                                                widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 16 //
            item.contentInsets.bottom = 19
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                      widthDimension: .fractionalWidth(1),
                     heightDimension: .absolute(300)),
                             subitem: item,
                               count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
        return section
        }
        
        return layout
    }
}
