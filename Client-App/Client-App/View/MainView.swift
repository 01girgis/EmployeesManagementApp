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

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
