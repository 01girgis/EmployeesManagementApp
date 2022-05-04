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
                //Snapshot That Contains Doc
                let realTimeData = snapshotDoc.data()
                
                //Load Parameters from Real-Time Snapshot
                let dataName = realTimeData["name"] as? String ?? "NoName"
                let dataJob = realTimeData["job"] as? String ?? "NoJob"
                
                //pass Parameters To The Model
                let getEmployeeData = Employee(id: UUID().uuidString , name: dataName, job: dataJob)
                return getEmployeeData
            }
        }
    }
}
