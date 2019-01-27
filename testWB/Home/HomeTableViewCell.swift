//
//  HomeTableViewCell.swift
//  testWB
//
//  Created by Adadémey Marvin on 27/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    var collectionToPresent = [testABCollection]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollView()
        Manager.instance.getCollections { (collections, error) in
            if error == nil {
                self.collectionToPresent = collections
                self.collectionView.reloadData()
            }
            else{
                
            }
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib.init(nibName: "HomeInCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewID")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewID", for: indexPath as IndexPath) as! HomeInCellCollectionViewCell
//            cell.picImageView.af_setImage(withURL: URL(string: collectionToPresent[indexPath.row].))
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (collectionToPresent.count)
    }
    
    
}
