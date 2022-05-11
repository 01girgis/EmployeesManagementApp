//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI
import FirebaseFirestore

struct MainView: View {
    
    //View Model Instance
    @ObservedObject var vModel = EmployeeListViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(vModel.listContent) {employee in
                    //Table View Content
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.green)
                            .frame(height: 100)
                        VStack(alignment: .leading){
                            Text("Employee : \(employee.name)")
                                .font(.title2)
                                .padding(.bottom , 10)
                            Text("Job-Title   : \(employee.job)")
                                .font(.title2)
                                .padding(.bottom,10)
                        }
                        .padding()
                        //VStack
                    }
                    .padding(-10)
                    //ZStack
                }//ForEach
            }
            .navigationTitle(Text("Employees"))
            .padding(EdgeInsets(top: 0
                                , leading: -20, bottom: 0, trailing: -20))
        }
 
    }
       
    //Data Fetching on Load App View
    init(){
        vModel.LoadData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
