//
//  CoinCollectionViewCell.swift
//  CoinSwift
//
//  Created by Ashfak Ahamed Alauddeen on 08/06/24.
//

import UIKit

class CoinCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinRank: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupViewWith(coinImage image: UIImage, coinSymbol symbol: String, coinName name: String, coinRank rank: Int ){
        self.coinImageView.image = image
        self.coinSymbol.text = symbol
        self.coinName.text = name
        self.coinRank.text = String(rank)
    }

}
