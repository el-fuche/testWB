//
//  HomeViewModel.swift
//  testWB
//
//  Created by Adadémey Marvin on 27/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import Foundation

class HomeViewModel {
//    static let instance = HomeViewModel()
//    let manager = Manager()
    var photoCollections = [testABCollection]()
    func getCollections(coll:@escaping ([testABCollection]) -> ()){
        Manager.instance.getCollections { (collections, error) in
            if error == nil{
            self.photoCollections = collections
            coll(self.photoCollections)
            }
            else{
                print(error.debugDescription)
            }
        }
        
        
    }
    
    
    
}
