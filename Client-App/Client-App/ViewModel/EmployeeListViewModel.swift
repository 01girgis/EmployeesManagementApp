//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Foundation
import FirebaseFirestore

class EmployeeListViewModel:ObservableObject{
    
    //Data Array of ViewModel
    @Published var listContent = [Employee] ()
    
    func LoadData(){
        //Database Connection
        let dbInstance = Firestore.firestore()
        
        //Data Snapshot Listener
        dbInstance.collection("Employees").addSnapshotListener { snapshotQuery , error in
            
            //Error Check
            guard error == nil else{
                print("\(error!.localizedDescription)")
                return
            }
            
            //Processes on FireBase Documents
            self.listContent = snapshotQuery!.documents.map { (snapshotDoc) -> Employee in
                let realTimeData = snapshotDoc.data()
             
            }
        }
    }
}
