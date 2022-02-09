//
//  TaskPage.swift
//  NewsApp
//
//  Created by 陳峻琦 on 5/2/2022.
//

import SwiftUI

struct TaskPage: View {
    @State var overViewSize: CGSize = .zero
    @State var dates: [String] = []
    let padding: CGFloat = 8
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color(red: 20/255, green: 158/255, blue: 231/255, opacity: 1), Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1)]),
                           startPoint: .top,
                           endPoint: .bottom)
            
            //顶部视图
            OverView()
                .measureSize { size in //测量顶部视图的Size
                    overViewSize = size
                }
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        Color.clear.frame(height: overViewSize.height + padding * 2)
                        
                        HStack {
                            Text("学习明细")
                                .font(.system(size: 16))
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedCorners(top: 15, background: Color.white))
                        
                        HStack {
                            Text("最近一周获得积分情况")
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                        }
                        .lineChartStyle()
                        
                        HStack {
                            ChartView()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .bottom])
                        .background(.white)
                        
                        //日期
                        HStack(spacing: 0) {
                            ForEach(dates, id: \.self) {
                                Text($0)
                                    .frame(width: (UIScreen.main.bounds.width - 30) / 7)
                                    .foregroundColor(Color(.sRGB, red: 151/255.0, green: 151/255.0, blue: 151/255.0, opacity: 1))
                                    .font(Font.system(size:12))
                            }
                        }
                        .lineChartStyle()
                        .onAppear {
                            dates = getWeekDate()
                        }
                        
                        HStack{
                            Text("今日获得0积分,快去完成下面的任务吧")
                                .foregroundColor(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                                .font(Font.system(size: 14))
                                .frame(maxWidth: .infinity,alignment: .center)
                                .padding()
                                .background(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 0.1))
                                .cornerRadius(5)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        
                        DailyTaskView()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                    }
                }
            }
        }
    }
    
    func getWeekDate() -> [String] {
        var dates: [String] = []
        dates.append("今日")
        
        for index in 1...6 {
            let sinceTime = index * -24 * 60 * 60 //距离今天的时间
            let date = Date(timeIntervalSinceNow: Double(sinceTime))
            let calendar = Calendar.current
            let comp = calendar.dateComponents([.month, .day], from: date)
            guard let day = comp.day, let month = comp.month else { return [] }
            
            var monthStr = "\(month)"
            if month < 10 {
                monthStr = "0\(month)"
            }
            
            var dayStr = "\(day)"
            if day < 10 {
                dayStr = "0\(day)"
            }
            
            dates.append("\(monthStr): \(dayStr)")
        }
        return dates.reversed()
    }
}

struct TaskPage_Previews: PreviewProvider {
    static var previews: some View {
        TaskPage()
            .ignoresSafeArea()
    }
}
