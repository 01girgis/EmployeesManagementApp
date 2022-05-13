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
                ForEach(vModel.listContent) { employee in
                    //Table View Content
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color(UIColor(red: 0.55, green: 0.70, blue: 0.33, alpha: 1.00)))
                            .frame(height: 100)
                        
                        //Data Content Stack
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
                .listRowBackground(Color(UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)))
            }
            .navigationTitle(Text("Employees"))
            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
        }
    }
       
    //View Class Constructor
    init(){
        // MARK: View
        //Set Background Color
        UITableView.appearance().backgroundColor = UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)
        
        //set navigation bar appearance to its Default Color
        let  barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)

        //apply the color on Scrolling
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        
        // MARK: DATA
        //Data Fetch from FireBase
        vModel.LoadData()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
