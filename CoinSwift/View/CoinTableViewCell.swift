//
//  CoinTableViewCell.swift
//  CoinSwift
//
//  Created by Ashfak Ahamed Alauddeen on 01/06/24.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinRank: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViewWith(coinImage image: UIImage, coinSymbol symbol: String, coinName name: String, coinRank rank: Int ){
        self.coinImage.image = image
        self.coinSymbol.text = symbol
        self.coinName.text = name
        self.coinRank.text = String(rank)
    }
    
}
