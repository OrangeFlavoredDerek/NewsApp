//
//  UserViewModel.swift
//  NewsApp
//
//  Created by 陳峻琦 on 25/2/2022.
//

import Foundation

let loggedKey: String = "loggedKey"

class UserViewModel: ObservableObject {
    //是否登登录
    @Published private(set) var isLogged: Bool = UserDefaults.standard.bool(forKey: loggedKey) {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: loggedKey)
        }
    }
    
    //用户名
    @Published var userName:String = ""
    
    
    //密码
    @Published var password:String = ""
    
    func signIn(completion: ()->()) {
        //走登录逻辑，如果成功的话，就调用以下代码；如果不成功的话，应该 toast 提示
        isLogged = true
        completion()
    }
}
