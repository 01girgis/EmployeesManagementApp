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
    
    //Data Retrieving
    func getData(){
        let dbInstance = Firestore.firestore()
    }
    
    //Real-time Data Snapshot Checking
    func snapshotDataChecking(){
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
    
    //Data Creating Function
    func DataAdd(Name:String , Job:String){
        //Database Connection
        let dbIntance = Firestore.firestore()
        
        //Data Insert to DB.
        dbIntance.collection("Employees").addDocument(data: ["name":Name , "job":Job]) { error in
            //Error Checking
            guard error == nil else {
                print("Inserting issue \n")
                print("\(error!.localizedDescription)")
                return
            }
            
            //Data Load after free error check
            self.snapshotDataChecking()
        }
    
    }
   
    //Data Delete Function
    func DataRemove(EmployeeToRemove:Employee ){
        //DB Connection Instance
        let dbInstance = Firestore.firestore()
        
        //Data Selection for remove
        dbInstance.collection("Employees").document(EmployeeToRemove.id.self).delete { error in
            //Error Checking
            guard error == nil else {
                print("Delete issue\n")
                print("\(error!.localizedDescription)")
                return
            }
            
            //Data Deleting Proccess
            DispatchQueue.main.async {
                
                //Remove Data  for the selected ID
                self.listContent.removeAll { employee in
                        return  employee.id ==  EmployeeToRemove.id
                }
            }
        }
        
    }
    
}
