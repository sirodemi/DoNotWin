//
//  ContentView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/07.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var memberList = ["chacky","akira","yossy","kiyo","shiro","A","B","C"]
    @Published var member1 = 0
    @Published var member2 = 1
    @Published var member3 = 2
    @Published var member4 = 4
    @Published var mahjangPay1 = 0
    @Published var mahjangPay2 = 0
    @Published var mahjangPay3 = 0
    @Published var mahjangPay4 = 0
    @Published var golfPay1 = 0
    @Published var golfPay2 = 0
    @Published var golfPay3 = 0
    @Published var golfPay4 = 0
}


struct ContentView: View {
    @ObservedObject var toto = ViewModel()
    @State private var selection = 0
    
    var body: some View {
        VStack{
            
            TabView(selection: $selection){
                TopView()
                    .environmentObject(toto)
                    .tabItem{
                    Image(systemName: "0.square.fill")
                    Text("TOP")
                    }
                    .tag(0)
                
                MemberView()
                    .environmentObject(toto)
                    .tabItem{
                    Image(systemName: "1.square.fill")
                    Text("Member")
                    }
                    .tag(1)
                
                MahjangView()
                    .environmentObject(toto)
                    .font(.title)
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Mahjang")
                    }
                    .tag(2)
                
                 
                GolfView()
                    .environmentObject(toto)
                    .font(.title)
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Golf")
                    }
                    .tag(3)
                
                TotalView()
                    .environmentObject(toto)
                    .tabItem{
                        Image(systemName: "4.square.fill")
                        Text("TOTAL")
                    }
                    .tag(4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
