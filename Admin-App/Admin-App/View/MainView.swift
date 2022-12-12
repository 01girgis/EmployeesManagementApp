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
    
    //Search Input filed
    @State var searchNote = ""
    
    //Subview Enviromental Variables ().
    @State private var launchAddSheet:Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(vModel.listContent) { employees in
                    //Table View Content
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color(UIColor(red: 0.55, green: 0.70, blue: 0.33, alpha: 1.00)))
                            .frame(height: 100)
                        
                        //Data Content Stack
                        VStack(alignment: .leading){
                            Text("Employee : \(employees.name)")
                                .font(.title2)
                                .padding(.bottom , 10)
                            Text("Job-Title   : \(employees.job)")
                                .font(.title2)
                                .padding(.bottom,10)
                                .swipeActions{
                                    //Delete Action Button
                                    Button("Delete"){
                                        print("\(employees.id)")
                                        vModel.DataRemove(EmployeeToRemove: employees)
                                        print("delete it")
                                    }
                                    .tint(.red)
                        }
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
            .searchable(text: $searchNote)
            .padding(EdgeInsets(top: 0, leading: -25, bottom: 0, trailing: -25))
            .scrollContentBackground(.hidden)
            .toolbar{
                ToolbarItemGroup (placement: .navigationBarTrailing){
                    Button("Add"){
                        launchAddSheet.toggle()
                        print("add tapped")
                    }
                    .tint(.black)
                    .font(.title3)
                }}
            
            //Action Sheet Launcher
            .sheet(isPresented: $launchAddSheet, onDismiss: {
                vModel.snapshotDataChecking()
            }){
                AddDataSheet()
            }
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
        
        //UICollection view set collor to navigation List color
        UICollectionView.appearance().backgroundColor = UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)
        
        // MARK: DATA
        //Data Fetch from FireBase
        vModel.snapshotDataChecking()
    }
    
    //DataFilter
    var searchFilter :[Employee] {
        if searchNote.isEmpty {
            return vModel.listContent
        } else {
            return vModel.listContent.filter{ $0.name == searchNote}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
