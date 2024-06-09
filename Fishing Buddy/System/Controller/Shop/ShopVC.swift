//
//  ShopVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit

class ShopVC: UIViewController  {
   
    

    @IBOutlet weak var topSction_cell: UICollectionView!
    @IBOutlet weak var shopItemView: UICollectionView!
    
    var top_section = ["All","Boats","Fishing Rods","Fishing Reels","Fishing Lure","Tshirts","Tent"]
    var shopitemImmg = ["homeimg10","homeimg3","homeimg4","homeimg5","homeimg6","homeimg7","homeimg8","homeimg9"]
   static var index = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.topSction_cell.dataSource = self
        self.topSction_cell.delegate = self
        self.shopItemView.delegate = self
        self.shopItemView.dataSource = self
        topSction_cell.register(UINib(nibName: "Shop_topmenu_cell", bundle: nil), forCellWithReuseIdentifier: "Shop_topmenu_cell")
        shopItemView.register(UINib(nibName: "Shopitem_cell", bundle: nil), forCellWithReuseIdentifier: "Shopitem_cell")
        
    }
    


}

extension ShopVC : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            top_section.count
        }
        else{
            HomeVC.fishstories_arr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shop_topmenu_cell", for: indexPath) as! Shop_topmenu_cell
            cell.section_name.text = top_section[indexPath.row]
            if indexPath.row == ShopVC.index {
                cell.section_view.backgroundColor = .systemBlue
                cell.section_name.textColor = .white
            }else {
                cell.section_view.backgroundColor = .white
                cell.section_name.textColor = .black
            }
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shopitem_cell", for: indexPath) as! Shopitem_cell
        
            cell.itemImageView.image = UIImage(named: HomeVC.fishstories_arr[indexPath.row])
            
            return cell
            
        }
            
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 0 {
            ShopVC.index = indexPath.row
            collectionView.reloadData()
        }
        else {
            
            let vc = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "ShopitemVC") as! ShopitemVC
            vc.itemimage = UIImage(named:ShopVC().shopitemImmg[indexPath.row])!
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
            

    }
    
}
