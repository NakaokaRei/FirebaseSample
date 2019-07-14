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
//        DBRef.child("message").observe(.childAdded, with: { [weak self](snapshot) -> Void in
//            let message = String(describing: snapshot.childSnapshot(forPath: "comment").value!)
//            self?.messageList.append(message)
//        })
    }
    
    func add(comment: String) {
        let data = ["comment": comment]
        DBRef.child("message").childByAutoId().setValue(data)
    }

}
