//
//  ContentView.swift
//  SampleProject
//
//  Created by Ajaaypranav R K on 29/10/22.
//

import SwiftUI

struct MWSListView: View {
   @ObservedObject var mwsVM = MWSViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(mwsVM.mwsList,id: \.id) { data in
                        ItemRow(mws: data)
                    }
                }
            }.navigationBarTitle("MWS")
                .onAppear(perform: onAppear)
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MWSListView()
        }
        
    }
}

extension MWSListView {
    func onAppear() {
        mwsVM.getMWSData()
    }
}
