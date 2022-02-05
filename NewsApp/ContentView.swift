//
//  ContentView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StudyPage()
                .tabItem {
                    Image("study_icon")
                    Text("学习")
                }
            TaskPage()
                .tabItem {
                    Image("task_icon")
                    Text("任务")
                }
            ProfilePage()
                .tabItem {
                    Image("mine_icon")
                    Text("我的")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
