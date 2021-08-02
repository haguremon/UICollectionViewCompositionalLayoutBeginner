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
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: .init(
                                                widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 16 //右からの間
            item.contentInsets.bottom = 19 //itemのボトムの間
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                            widthDimension: .fractionalWidth(1),
                                                            heightDimension: .absolute(300)), //300の高さのグループ
                                                           subitem: item,
                                                           count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        
    }
}
