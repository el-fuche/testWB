//
//  HomeViewController.swift
//  testWB
//
//  Created by Adadémey Marvin on 27/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var collectionsToPresent = [testABCollection]()
    @IBOutlet weak var tableView: UITableView!
    var homeVM = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableView()
        homeVM.getCollections { (colls) in
            self.collectionsToPresent = colls
            self.tableView.reloadData()
        }
//        Manager.instance.getCollections { (collections, error) in
//            if error == nil {
//                
//            }
//            else{
//                
//            }
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collectionsToPresent.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellID", for: indexPath as IndexPath) as! HomeTableViewCell
        

        return cell
    }
    
    func setUI(){
        self.view.addSubview(tableView)
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.frame
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCellID")
//        self.tableView.register()

    }
    
   
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return collectionsToPresent[section].title
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
