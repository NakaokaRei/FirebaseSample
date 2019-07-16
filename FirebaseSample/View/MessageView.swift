//
//  MessageView.swift
//  FirebaseSample
//
//  Created by 中岡黎 on 2019/07/14.
//  Copyright © 2019 NakaokaRei. All rights reserved.
//

import SwiftUI

struct MessageView : View {
    var firebaseModel: FirebaseViewModel
    @State private var message: String = ""
    var body: some View {
        HStack {
            TextField($message, placeholder: Text("message")){
                UIApplication.shared.keyWindow?.endEditing(true)
            }
            .frame(height: 40)
            .padding(.horizontal, 8)
            .border(Color.gray, cornerRadius: 8)
            
            Image(systemName: "plus.circle").imageScale(.large)
                .tapAction {
                    guard !self.message.isEmpty else {
                        return
                    }
                    self.firebaseModel.add(message: self.message)
                    self.clear()
            }
        }
    }
    
    private func clear() {
        message = ""
    }
}

#if DEBUG
struct MessageView_Previews : PreviewProvider {
    static var previews: some View {
        MessageView(firebaseModel: FirebaseViewModel())
    }
}
#endif
