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
    var body: some View {
        NavigationView{
            List{
                MessageView(firebaseModel: firebaseModel)
                ForEach(firebaseModel.messageList.identified(by: \.self)){ comment in
                    MessageRow(message: comment)
                }
            }
            .navigationBarTitle(Text("Message"))
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
