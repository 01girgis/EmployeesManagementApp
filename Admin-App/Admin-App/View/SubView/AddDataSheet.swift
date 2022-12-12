//
//
//
//  Created by Roumany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct AddDataSheet: View {
    
    //Environmental Variables
    @ObservedObject var  vModel = EmployeeListViewModel()
    @Environment (\.dismiss) var terminateView
    
    //Sub View variables
    @State private var  name:String = ""
    @State private var  job:String  = ""
    
    var body: some View {
        VStack(alignment: .leading , spacing:  25){
            //Data Fields
            Text("Employee Name")
                .font(.custom("Geneva", size: 20).bold())
            TextField("enter employee", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Employee Job")
                .font(.custom("Geneva", size: 20).bold())
            TextField( "enter job" , text: $job)
                .textFieldStyle(.roundedBorder)
            
            //Submit Button
            Button("ADD"){
                vModel.DataAdd(Name: name, Job: job)
                terminateView()
                print("Data Submit")
            }
            .padding(20)
            .font(.system(size: 20))
            .background(Color(UIColor(red: 0.55, green: 0.70, blue: 0.33, alpha: 1.00)))
            .cornerRadius(40)
            .foregroundColor(.black)
            Spacer()
        }
        .padding()
        .background(Color(UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)))
        .background().ignoresSafeArea()
    }
}

struct AddDataSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddDataSheet()
    }
}
