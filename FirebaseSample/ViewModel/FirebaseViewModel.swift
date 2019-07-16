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
    var messageList: [String] = ["これはサンプルです"] {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        DBRef = Database.database().reference()
        DBRef.child("messages").observe(.childAdded, with: { [weak self](snapshot) -> Void in
            let message = String(describing: snapshot.childSnapshot(forPath: "message").value!)
            self?.messageList.append(message)
        })
    }
    
    func add(message: String) {
        let data = ["message": message]
        DBRef.child("messages").childByAutoId().setValue(data)
    }

}
