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
        
        //Data Collection Selection
        dbInstance.collection("Employees").addSnapshotListener{ (snapShot , error) in
            //Error Checking
            guard let snapshotUpdater = snapShot?.documents else {
                print("\(error!.localizedDescription)")
                return
            }
            
            //Mapping Data Based On Employee Class
            self.listContent = snapshotUpdater.map {  dataReLoader -> Employee in
                //Data Loader
                let dataPayload = dataReLoader.data()
                
                //Load Parameters from Real-Time Snapshot
                let myName = dataPayload["name"] as? String ?? "NoName"
                let myJob = dataPayload["job"] as? String ?? "NoJob"
                
                //pass Parameters To The Model
                let myEmployee = Employee(id: UUID().uuidString , name: myName, job: myJob)
                return myEmployee
            }
       
        }
    }
    
}
