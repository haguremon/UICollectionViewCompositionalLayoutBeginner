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
    let category = ["Deals","Grocery","Alocohol","Rewards","Japanese","Burgers","American","8","9","10","11","12"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
       
    }
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout.createLayout())
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
            return 5
        case 6:
            return 5
        case 8...9:
            return 5
        case 11:
            return category.count
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
        case 3:
            cell.label.text = "3"
            return cell
        case 6:
            cell.label.text = "6"
            return cell
        case 8:
            cell.label.text = "8"
            return cell
        case 9:
            cell.label.text = "9"
            return cell
        case 11:
            cell.label.text = category[indexPath.row]
            return cell
        default:
            cell.label.text = "1"
            return cell
        
        }
        
        }
        
    }




