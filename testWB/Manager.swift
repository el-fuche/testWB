//
//  Manager.swift
//  testWB
//
//  Created by Adadémey Marvin on 27/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import UIKit
import UnsplasherSDK

class Manager {
    static let instance = Manager()
    let myGroup = DispatchGroup()

//    var _usersList = [UsersModel] ()
//
//    var usersList: [UsersModel] {
//        return _usersList
//    }
    var _homeViewModel = HomeViewModel()
    
    var homeViewModel : HomeViewModel{
        return _homeViewModel
    }
    
    let collectionsClient = Unsplash.shared.collections
    
    
    func getCollections(collectionsToEscape:@escaping ([testABCollection],Error?) -> ()){
        var collToReturn = [testABCollection]()
        // Get a list of collections
        collectionsClient?.collections(list: .featured, page: 1, perPage: 20) { result in
            switch result {
            case .success(let collections):
                
                for collection in collections {
                    self.myGroup.enter()

                    print("\(collection.title), Total photos: \(String(describing: collection.totalPhotos)), CollectionID: \(collection.id)")
                    self.getTofs(collID: collection.id, photosToEscape: { (photos, error) in
                        if error == nil {
                            let coll = testABCollection(id: collection.id, title: collection.title, numberOfPhotos: collection.totalPhotos, photos: photos)
                            collToReturn.append(coll)
                        }
                        else{
                            
                        }
                    })
                    
                }
                self.myGroup.leave()

//                DispatchQueue.main.async {
                self.myGroup.notify(queue: DispatchQueue.main, execute: {
                   
                collectionsToEscape(collToReturn,nil)
                })
            case .failure(let error):
                print("Error: " + error.localizedDescription)
                collectionsToEscape(collToReturn,error)
                
            }
        }
    }
    
    func getTofs(collID:UInt32,photosToEscape:@escaping ([testABPhoto],Error?) -> ()){
        var photos = [testABPhoto]()
        collectionsClient?.photos(in: collID, page: 1, perPage: 100) { result in
            if let tof = result.value{
                for tf in tof{
                    if let urlStr = tf.urls?.full.absoluteString{
                        let photo = testABPhoto(id: tf.id, url: urlStr)
                        photos.append(photo)
                    }
                }
                photosToEscape(photos, nil)
            }
            /* handle the result */ }
        
    }
}
