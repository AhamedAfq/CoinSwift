//
//  CoinCollectionViewController.swift
//  CoinSwift
//
//  Created by Ashfak Ahamed Alauddeen on 08/06/24.
//

import UIKit

class CoinCollectionViewController: UIViewController{
    
    var coinMapModel: CoinMapModel?
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        // Register the custom cell
        let nib = UINib(nibName: "CoinCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CoinCollectionViewCell")

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.dataSource = self
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.isPagingEnabled = false
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
        // Ensure the layout is updated with the correct item size
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                   let itemWidth = collectionView.bounds.width * 2 / 3  // 1.5 cells visible
                   let itemHeight = collectionView.bounds.height * 0.6
                   layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
                   layout.minimumLineSpacing = (collectionView.bounds.width - itemWidth) / 2  // Center the cells
        }
    }
}

extension CoinCollectionViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinMapModel?.data?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinCollectionViewCell", for: indexPath) as! CoinCollectionViewCell

        if let symbol = coinMapModel?.data?[indexPath.row].symbol, let coinName = coinMapModel?.data?[indexPath.row].name, let rank = coinMapModel?.data?[indexPath.row].rank{
            cell.setupViewWith(coinImage: UIImage(resource: .bitcoinSvg), coinSymbol: symbol, coinName: coinName, coinRank: rank)
        }
        return cell
    }
}

extension CoinCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width * 2 / 3 // 1.5 cells visible
        let itemHeight = collectionView.bounds.height * 0.6 // Adjust to desired height, e.g., 60% of collection view height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
