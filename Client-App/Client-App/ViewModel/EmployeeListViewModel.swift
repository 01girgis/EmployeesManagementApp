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
        dbInstance.collection("Employees").addSnapshotListener { snapshootQuery , error in
            
            
        }
    }
}
