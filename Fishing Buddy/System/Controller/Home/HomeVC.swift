//
//  HomeVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 14/02/24.
//

import UIKit

class HomeVC: UIViewController  {
  
    
   

    @IBOutlet weak var collecationView: UICollectionView!
    
    @IBOutlet weak var tableview: UITableView!
    
    var homearr = ["homeimg1","homeimg2","homeimg3","homeimg4"]
    
    static var fishstories_arr = ["homeimg2","homeimg3","homeimg4","homeimg5","homeimg6","homeimg7"]
    static var profileimg_arr = ["1","2","3","4","5","6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupdidload()
     
        
    }
    

    

}


extension HomeVC: UICollectionViewDataSource ,UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate{
    
    func setupdidload()  {
        self.collecationView.dataSource = self
        self.collecationView.delegate = self
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.collecationView.register(UINib(nibName: "home_image_Cell", bundle: nil), forCellWithReuseIdentifier: "home_image_Cell")
        self.tableview.register(UINib(nibName: "Home_story_Cell", bundle: nil), forCellReuseIdentifier: "Home_story_Cell")
    }
    
    //MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homearr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home_image_Cell", for: indexPath) as! home_image_Cell
        cell.imageview.image = UIImage(named: homearr[indexPath.row])
        
        return cell
    }
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        HomeVC.fishstories_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home_story_Cell", for: indexPath) as! Home_story_Cell
        cell.imageview.image = UIImage(named: HomeVC.fishstories_arr[indexPath.row])
        cell.profileimg.image = UIImage(named: HomeVC.profileimg_arr[indexPath.row])
        
        return cell
        
    }
    
    
}
