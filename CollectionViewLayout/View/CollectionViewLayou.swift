//
//  CollectionViewLayou.swift
//  CollectionViewLayout
//
//  Created by IwasakIYuta on 2021/08/02.
//

import Foundation
import UIKit
class CollectionViewLayout {
    //分割されたカテゴリー
    func separateCategorySection() -> NSCollectionLayoutSection {
        //itemのサイズ
            let item = NSCollectionLayoutItem(layoutSize: .init(
                                                widthDimension: .fractionalWidth(0.25), //アイテムの幅を25％
                                                heightDimension: .absolute(100)))//100%
            //ここでセルの間をあける
            item.contentInsets.leading = 3
            item.contentInsets.trailing = 3 //右からの間
            item.contentInsets.bottom = 20 //itemのボトムの間
            //グループを作成
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])//koko注意horizontal注意とかの引数
            
            let section = NSCollectionLayoutSection(group: group)
            item.contentInsets.leading = 3
            //section.supplementariesFollowContentInsets = false
            section.orthogonalScrollingBehavior = .paging
        section.contentInsets = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
            return section
        
    }
    
    
    func categoryScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(0.20), //100%
                                            heightDimension: .fractionalHeight(1)))//100%
     
        item.contentInsets = .init(top: 20, leading: 1, bottom: 20, trailing: 1)
        //グループを作成
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(0.20),
                                                        heightDimension: .absolute(100)), //300の高さのグループ
                                                       subitem: item,
                                                       count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        return section
    }
    
    
    //スクロールありセクション
    func createScrollSection() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(1), //100%
                                            heightDimension: .fractionalHeight(1)))//100%
        //ここでセルの間をあける
        item.contentInsets.leading = 3
        item.contentInsets.trailing = 3 //右からの間
        item.contentInsets.bottom = 19 //itemのボトムの間
        //グループを作成
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1),
                                                        heightDimension: .absolute(200)), //300の高さのグループ
                                                       subitem: item,
                                                       count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        return section
    }
    
    
    //スクロールしないセクション
    func createSection() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(1), //100%
                                            heightDimension: .fractionalHeight(1)))//100%
        //ここでセルの間をあける
        item.contentInsets.leading = 3
        item.contentInsets.trailing = 3 //右からの間
        item.contentInsets.bottom = 19 //itemのボトムの間
        //グループを作成
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1),
                                                        heightDimension: .absolute(300)), //300の高さのグループ
                                                       subitem: item,
                                                       count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        return section
    }
    
    
    
    
    
    func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0: //カテゴリー
                return self?.categoryScrollSection()
            case 3:
                return self?.createScrollSection()
            case 6:
                return self?.createScrollSection()
            case 8:
                return self?.createScrollSection()
            case 9:
                return self?.createScrollSection()
            case 11://カテゴリー
                return self?.separateCategorySection()
            default:
                return self?.createSection()
            }
        }
    return layout
    }
    
   
}
