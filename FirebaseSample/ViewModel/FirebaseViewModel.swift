//
//  FirebaseViewModel.swift
//  FirebaseSample
//
//  Created by 中岡黎 on 2019/07/11.
//  Copyright © 2019 NakaokaRei. All rights reserved.
//

import SwiftUI
import Combine
import Firebase


final class FirebaseViewModel: BindableObject{
    let didChange = PassthroughSubject<FirebaseViewModel, Never>()
    var DBRef:DatabaseReference!
    
    init() {
        DBRef = Database.database().reference()
    }
    
    func add(name: String) {
        let data = ["name": name]
        DBRef.child("user/01").setValue(data)
    }

}
