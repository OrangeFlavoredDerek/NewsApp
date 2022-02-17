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
                TaskPage()
                    .tabItem {
                        Image("task_icon")
                        Text("任务")
                    }
                    .ignoresSafeArea()
                ProfilePage()
                    .tabItem {
                        Image("mine_icon")
                        Text("我的")
                    }
            }
            .hiddenNavigationBarStyle()
        }
        .statusBar(hidden: true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
