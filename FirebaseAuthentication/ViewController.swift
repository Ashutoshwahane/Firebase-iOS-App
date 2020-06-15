//
//  ViewController.swift
//  FirebaseAuthentication
//
//  Created by Ashutosh Wahane on 15/06/20.
//  Copyright © 2020 Ashutosh Wahane. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // instance for firestore
        let db = Firestore.firestore()
        
        // adding a Document
        // creating collection wine
        db.collection("wine").addDocument(data: ["year":2020,"type":"grapes","label":"Nashik"])
        
        // adding data by reference id
        let newData = db.collection("wine").document()
        newData.setData(["year":1998,"type":"grapes","label":"gondia","id":newData.documentID])
        
        
        // adding data with specific ID
        db.collection("wine").document("wine001").setData(["dummy":"data","newkey":"data 2"],merge: true)
        
        // delete document
        db.collection("wine").document("wine001").delete()
        
        // read data
        db.collection("wine").document("checkdocument").getDocument { (doc, error) in
            if error != nil{
                if doc != nil && doc!.exists{
                    let data = doc!.data()
                    
                }
            }
        }
        
        // read documents
        db.collection("wine").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for i in snapshot!.documents{
                    let dData = i.data()
                }
            }
        }
        
        // getting subset of data
        
        
        
        
        
    }


}

