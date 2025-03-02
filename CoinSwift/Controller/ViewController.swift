//
//  ViewController.swift
//  CoinSwift
//
//  Created by Ashfak Ahamed Alauddeen on 01/06/24.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var coinSwiftNetworkHelper = CoinSwiftNetworkHelper()
    var coinMapModel: CoinMapModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Crypto ranks"
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "text.viewfinder"), style: .plain, target: self, action: #selector(rightButtonAction(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = .black
        tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinTableViewCell")
        coinSwiftNetworkHelper.delegate = self
        coinSwiftNetworkHelper.getCoinMapAPI()
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        // Your code here
        print("Right button tapped")
        self.performSegue(withIdentifier: "showCollectionViewController", sender: self)
        
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "showCollectionViewController") as? CoinCollectionViewController{
//            vc.coinMapModel = self.coinMapModel
//            navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCollectionViewController" {
            if let collectionVC = segue.destination as? CoinCollectionViewController {
                collectionVC.coinMapModel = self.coinMapModel
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = coinMapModel?.data?.count{
         return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinTableViewCell", for: indexPath) as? CoinTableViewCell else{
            return UITableViewCell()
        }
        if let symbol = coinMapModel?.data?[indexPath.row].symbol, let coinName = coinMapModel?.data?[indexPath.row].name, let rank = coinMapModel?.data?[indexPath.row].rank{
            cell.setupViewWith(coinImage: UIImage(resource: .bitcoinSvg), coinSymbol: symbol, coinName: coinName, coinRank: rank)
        }
        cell.coinImage.layer.cornerRadius = 26
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = coinMapModel?.data?.count{
         return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
}

extension ViewController: CoinSwiftNetworkHelperDelegate{
    
    func getCoinMapModel(from coinMapModel: CoinMapModel) {
        self.coinMapModel = coinMapModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

