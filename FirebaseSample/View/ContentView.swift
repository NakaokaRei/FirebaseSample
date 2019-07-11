//
//  ContentView.swift
//  FirebaseSample
//
//  Created by 中岡黎 on 2019/07/11.
//  Copyright © 2019 NakaokaRei. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject private var firebaseModel: FirebaseViewModel
    @State private var name: String = ""
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("name")
                TextField($name, placeholder: Text("Input your name..."))
                Spacer()
            }
            Button(action: {
                self.firebaseModel.add(name: self.name)
            }) {
                Text("Add")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirebaseViewModel())
    }
}
#endif
