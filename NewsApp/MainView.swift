//
//  ContentView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                StudyPage()
                    .tabItem {
                        Image("study_icon")
                        Text("学习")
                    }
                    //.hiddenNavigationBarStyle()
                TaskPage()
                    .tabItem {
                        Image("task_icon")
                        Text("任务")
                    }
                    .edgesIgnoringSafeArea(.top)
                ProfilePage()
                    .tabItem {
                        Image("mine_icon")
                        Text("我的")
                    }
            }
            .hiddenNavigationBarStyle()
            //.navigationBarTitleDisplayMode(.inline)
        }
        //.statusBar(hidden: true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
