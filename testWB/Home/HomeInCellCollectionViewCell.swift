//
//  HomeInCellCollectionViewCell.swift
//  testWB
//
//  Created by Adadémey Marvin on 27/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import UIKit

class HomeInCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var picImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        picImageView.image = UIImage(named: "Placeholder")
        // Initialization code
    }

}
