//
//  ShopitemVC.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 19/02/24.
//

import UIKit

class ShopitemVC: UIViewController {
   
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var moresuggestionCollectionview: UICollectionView!
    
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var callBut: UIButton!
    @IBOutlet weak var chatbutView: UIView!
    @IBOutlet weak var chatBut: UIButton!
    
    var itemimage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        chatBut.layer.cornerRadius = 8
        callBut.layer.cornerRadius = 8
        callBut.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        chatBut.setgradiantcolor(color: [UIColor.garidant2 , UIColor.garidant1], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        itemImage.image = itemimage
        moresuggestionCollectionview.dataSource = self
        moresuggestionCollectionview.delegate = self
        moresuggestionCollectionview.register(UINib(nibName: "Shopitem_cell", bundle: nil), forCellWithReuseIdentifier: "Shopitem_cell")
        
    }
    

    @IBAction func backBut(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
   

}

extension ShopitemVC:  UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ShopVC().shopitemImmg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shopitem_cell", for: indexPath) as! Shopitem_cell
        cell.itemImageView.image = UIImage(named: ShopVC().shopitemImmg[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "ShopitemVC") as! ShopitemVC
        vc.itemimage = UIImage(named:ShopVC().shopitemImmg[indexPath.row])!
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
