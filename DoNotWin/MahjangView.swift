//
//  MahjangView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/07.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI
import Combine

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}

struct MahjangView: View {
    @EnvironmentObject var toto: ViewModel
    @State private var rate = [1,2,3,5,10,20]
    @State private var pointRate = 3
    @State private var tipRate  = 2
    @State private var point_member1 = ""
    @State private var point_member2 = ""
    @State private var point_member3 = ""
    @State private var point_member4 = ""
    @State private var tip_member1 = ""
    @State private var tip_member2 = ""
    @State private var tip_member3 = ""
    @State private var tip_member4 = ""
    @State private var point_difference = 0
    @State private var tip_difference  = 0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Point Rate")
                        .font(.body)
                
                    Picker(selection: $pointRate, label: Text("Picker")) {
                        ForEach(0..<rate.count){
                            index in
                            Text("\(self.rate[index])").tag(index)
                        }
                    }
                }
                .frame(width: 350.0)
                .pickerStyle(SegmentedPickerStyle())
                .offset(CGSize(width: 0, height: -150))
                
                HStack {
                    Text("Tip Rate ")
                        .font(.body)
                
                    Picker(selection: $tipRate, label: Text("Picker")) {
                        ForEach(0..<rate.count){
                            index in
                            Text("\(self.rate[index])").tag(index)
                        }
                    }
                }
                .frame(width: 350.0)
                .pickerStyle(SegmentedPickerStyle())
                .offset(CGSize(width: 0, height: -150))
                
                Text("mahjang")
                    .font(.title)
                    .fontWeight(.heavy)
                    .offset(CGSize(width: 0, height: -100))
                Text("don't win")
                    .font(.body)
                    .offset(CGSize(width: 0, height: -100))
                
                HStack {
                    Spacer()
                    if(point_difference != 0){
                        Text("point_difference: \(point_difference)")
                    }
                    Spacer()
                    if(tip_difference != 0){
                        Text("tip_difference: \(tip_difference)")
                    }
                    Spacer()
                }
                .font(.body)
                .offset(CGSize(width: 0, height: -80))
                .foregroundColor(.red)
            
                HStack {
                    Text(toto.memberList[toto.member1])
                        .foregroundColor(.purple)
                        .frame(width:95)
                    Text(toto.memberList[toto.member2])
                        .foregroundColor(.blue)
                        .frame(width:95)
                    Text(toto.memberList[toto.member3])
                        .foregroundColor(.orange)
                        .frame(width:95)
                    Text(toto.memberList[toto.member4])
                        .foregroundColor(.green)
                        .frame(width:95)
                }
                .font(.title)
                .offset(CGSize(width: 0, height: -50))
                .multilineTextAlignment(.center)
                
                HStack{
                    Spacer(minLength: 10)
                    TextField("point", text: $point_member1, onEditingChanged:{_ in 
                        self.point_difference = self.checkSumPoint()
                    } )
                        .frame(width:90)
                    Spacer()
                    TextField("point", text: $point_member2, onEditingChanged:{_ in
                        self.point_difference = self.checkSumPoint()
                    } )
                        .frame(width:90)
                    Spacer()
                    TextField("point", text: $point_member3, onEditingChanged:{_ in
                        self.point_difference = self.checkSumPoint()
                    } )
                        .frame(width:90)
                    Spacer()
                    TextField("point", text: $point_member4, onEditingChanged:{_ in
                        self.point_difference = self.checkSumPoint()
                    } )
                        .frame(width:90)
                    Spacer(minLength: 10)
                }
                .multilineTextAlignment(.trailing)
                .offset(CGSize(width: 0, height: -50))
                    
                HStack{
                    Spacer(minLength: 10)
                    TextField("tip", text: $tip_member1, onEditingChanged:{_ in
                        self.tip_difference = self.checkSumTip()
                    } )
                        .frame(width:90)
                    Spacer()
                    TextField("tip", text: $tip_member2, onEditingChanged:{_ in
                        self.tip_difference = self.checkSumTip()
                    } )
                        .frame(width:90)
                    Spacer()
                    TextField("tip", text: $tip_member3, onEditingChanged:{_ in
                        self.tip_difference = self.checkSumTip()
                    } )
                        .frame(width:90)
                    Spacer()
                    TextField("tip", text: $tip_member4, onEditingChanged:{_ in
                        self.tip_difference = self.checkSumTip()
                    } )
                        .frame(width:90)
                    Spacer(minLength: 10)
                }
                .multilineTextAlignment(.trailing)
                .offset(CGSize(width: 0, height: -50))
                .padding(.bottom, 50.0)
                
                HStack{
                    Spacer(minLength: 10)
                    Text("\(calc(arg1: (Int(point_member1) ?? 0) , arg2: (Int(tip_member1) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (Int(point_member2) ?? 0) , arg2: (Int(tip_member2) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (Int(point_member3) ?? 0) , arg2: (Int(tip_member3) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (Int(point_member4) ?? 0) , arg2: (Int(tip_member4) ?? 0)))")
                        .frame(width:90)
                    Spacer(minLength: 10)
                }
                .offset(CGSize(width: 0, height: -50))
                .font(Font.custom("AppleSDGothicNeo-UltraLight", size: 24.0))
            }
        }
        .onDisappear(perform:  calculate)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.numbersAndPunctuation)
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.closeKeyboard()
            }
        )
    }
    
    private func calc(arg1: Int, arg2: Int) -> Int{
        let answer = arg1 * rate[pointRate] * 10 + arg2 * rate[tipRate] * 100
        return answer
    }
    
    private func calculate() {
        var pointPay = 0
        var tipPay = 0
        pointPay = ((Int(point_member1) ?? 0) * rate[pointRate] * 10)
        tipPay = ((Int(tip_member1) ?? 0) * rate[tipRate] * 100)
        toto.mahjangPay1 = pointPay + tipPay
        
        pointPay = ((Int(point_member2) ?? 0) * rate[pointRate] * 10)
        tipPay = ((Int(tip_member2) ?? 0) * rate[tipRate] * 100)
        toto.mahjangPay2 = pointPay + tipPay
        
        pointPay = ((Int(point_member3) ?? 0) * rate[pointRate] * 10)
        tipPay = ((Int(tip_member3) ?? 0) * rate[tipRate] * 100)
        toto.mahjangPay3 = pointPay + tipPay
        
        pointPay = ((Int(point_member4) ?? 0) * rate[pointRate] * 10)
        tipPay = ((Int(tip_member4) ?? 0) * rate[tipRate] * 100)
        toto.mahjangPay4 = pointPay + tipPay
    }
    
    
    private func checkSumPoint() -> Int{
        var sum  = 0
        var sum1 = 0
        var sum2 = 0
        var sum3 = 0
        var sum4 = 0
        sum1 = (Int(point_member1) ?? 0)
        sum2 = (Int(point_member2) ?? 0)
        sum3 = (Int(point_member3) ?? 0)
        sum4 = (Int(point_member4) ?? 0)
        sum  = sum1 + sum2 + sum3 + sum4
        return sum
    }
    
    private func checkSumTip() -> Int{
        var sum  = 0
        var sum1 = 0
        var sum2 = 0
        var sum3 = 0
        var sum4 = 0
        sum1 = (Int(tip_member1) ?? 0)
        sum2 = (Int(tip_member2) ?? 0)
        sum3 = (Int(tip_member3) ?? 0)
        sum4 = (Int(tip_member4) ?? 0)
        sum  = sum1 + sum2 + sum3 + sum4
        return sum
    }
 
}

struct MahjangView_Previews: PreviewProvider {
    static var previews: some View {
        MahjangView()
    }
}
