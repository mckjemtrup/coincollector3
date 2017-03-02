//
//  ViewController.swift
//  CoinCollecter3
//
//  Created by Michael Kjemtrup on 01/03/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var coinTableView: UITableView!
    
    var coins : [Coins] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinTableView.dataSource = self
        coinTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let contexting = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
        coins = try contexting.fetch(Coins.fetchRequest())
            print(coins)
        } catch {
            
        }
        coinTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let coin = coins[indexPath.row]
        cell.textLabel?.text = coin.title
        cell.imageView?.image = UIImage(data: coin.image! as Data )
        return cell
        
    }


}

