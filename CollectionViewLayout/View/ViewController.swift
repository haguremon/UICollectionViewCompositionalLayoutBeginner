//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by IwasakIYuta on 2021/08/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! = nil
    private var collectionViewLayout = CollectionViewLayout()
    //private var collectionView: UICollectionView? = nil
    let category = ["Deals","Grocery","Alocohol","Rewards","Japanese","Burgers","American"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
       
    }
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout.createLayout())
        //collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = .white
            
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView!)
            collectionView!.delegate = self
            collectionView!.dataSource = self
        }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return category.count
        case 3:
            return 8
        case 6:
            return 7
        case 8:
            return 5
        case 9:
            return 6
        case 11:
            return 10
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.label.text = category[indexPath.row]
            return cell
        default:
            return cell
        }
        
    }


}

