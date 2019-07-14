//
//  MessageRow.swift
//  FirebaseSample
//
//  Created by 中岡黎 on 2019/07/14.
//  Copyright © 2019 NakaokaRei. All rights reserved.
//

import SwiftUI

struct MessageRow : View {
    var message: String
    var body: some View {
        Text(message)
    }
}

#if DEBUG
struct MessageRow_Previews : PreviewProvider {
    static var previews: some View {
        MessageRow(message: "これはサンプルです")
    }
}
#endif
