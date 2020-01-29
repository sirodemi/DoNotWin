//
//  GolfView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/07.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI
import Combine

struct GolfView: View {
    @EnvironmentObject var toto: ViewModel
    @State var rate = [10,50,100,300,500,1000]
    @State var smallRate  = 2
    @State var largeRate = 4
    @State var small_member1 = ""
    @State var small_member2 = ""
    @State var small_member3 = ""
    @State var small_member4 = ""
    @State var large_member1 = ""
    @State var large_member2 = ""
    @State var large_member3 = ""
    @State var large_member4 = ""
    @State var small_difference = 0
    @State var large_difference = 0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Small Rate")
                        .font(.body)
                    Picker("Numbers",selection: $smallRate) {
                        ForEach(0 ..< rate.count) { index in
                            Text("\(self.rate[index])").tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .frame(width: 350.0)
                .offset(CGSize(width: 0, height: -150))
                
                HStack {
                    Text("Large Rate")
                        .font(.body)
                    Picker("Numbers",selection: $largeRate) {
                        ForEach(0 ..< rate.count) { index in
                            Text("\(self.rate[index])").tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .frame(width: 350.0)
                .offset(CGSize(width: 0, height: -150))
                
                Text("golf")
                    .font(.title)
                    .fontWeight(.heavy)
                    .offset(CGSize(width: 0, height: -100))
                Text("don't win")
                    .font(.body)
                    .offset(CGSize(width: 0, height: -100))
                
                HStack {
                    Spacer()
                    if(small_difference != 0){
                        Text("small_difference: \(small_difference)")
                    }
                    Spacer()
                    if(large_difference != 0){
                        Text("large_difference: \(large_difference)")
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
                    TextField("small", text: $small_member1, onEditingChanged:{_ in
                        self.small_difference = self.checkSumSmall()
                    })
                        .frame(width:90)
                    Spacer()
                    TextField("small", text: $small_member2, onEditingChanged:{_ in
                        self.small_difference = self.checkSumSmall()
                    })
                        .frame(width:90)
                    Spacer()
                    TextField("small", text: $small_member3, onEditingChanged:{_ in
                        self.small_difference = self.checkSumSmall()
                    })
                        .frame(width:90)
                    Spacer()
                    TextField("small", text: $small_member4, onEditingChanged:{_ in
                        self.small_difference = self.checkSumSmall()
                    })
                        .frame(width:90)
                    Spacer(minLength: 10)
                }
                .multilineTextAlignment(.trailing)
                .offset(CGSize(width: 0, height: -50))
                
                HStack{
                    Spacer(minLength: 10)
                    TextField("large", text: $large_member1, onEditingChanged:{_ in
                        self.large_difference = self.checkSumLarge()
                    })
                        .frame(width:90)
                    Spacer()
                    TextField("large", text: $large_member2, onEditingChanged:{_ in
                        self.large_difference = self.checkSumLarge()
                    })
                        .frame(width:90)
                    Spacer()
                    TextField("large", text: $large_member3, onEditingChanged:{_ in
                        self.large_difference = self.checkSumLarge()
                    })
                        .frame(width:90)
                    Spacer()
                    TextField("large", text: $large_member4, onEditingChanged:{_ in
                        self.large_difference = self.checkSumLarge()
                    })
                        .frame(width:90)
                    Spacer(minLength: 10)
                }
                .multilineTextAlignment(.trailing)
                .offset(CGSize(width: 0, height: -50))
                .padding(.bottom, 50.0)
                
                HStack{
                    Spacer(minLength: 10)
                    Text("\(calc(arg1: (Int(small_member1) ?? 0) , arg2: (Int(large_member1) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (Int(small_member2) ?? 0) , arg2: (Int(large_member2) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (Int(small_member3) ?? 0) , arg2: (Int(large_member3) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (Int(small_member4) ?? 0) , arg2: (Int(large_member4) ?? 0)))")
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
        let answer = arg1 * rate[smallRate]  + arg2 * rate[largeRate]
        return answer
    }
    
    private func calculate() {
        var smallPay = 0
        var largePay = 0
        smallPay = ((Int(small_member1) ?? 0) * rate[smallRate] )
        largePay = ((Int(large_member1) ?? 0) * rate[largeRate] )
        toto.golfPay1 = smallPay + largePay
        
        smallPay = ((Int(small_member2) ?? 0) * rate[smallRate] )
        largePay = ((Int(large_member2) ?? 0) * rate[largeRate] )
        toto.golfPay2 = smallPay + largePay
        
        smallPay = ((Int(small_member3) ?? 0) * rate[smallRate] )
        largePay = ((Int(large_member3) ?? 0) * rate[largeRate] )
        toto.golfPay3 = smallPay + largePay
        
        smallPay = ((Int(small_member4) ?? 0) * rate[smallRate] )
        largePay = ((Int(large_member4) ?? 0) * rate[largeRate] )
        toto.golfPay4 = smallPay + largePay
    }
    
    private func checkSumSmall() -> Int{
        var sum  = 0
        var sum1 = 0
        var sum2 = 0
        var sum3 = 0
        var sum4 = 0
        sum1 = (Int(small_member1) ?? 0)
        sum2 = (Int(small_member2) ?? 0)
        sum3 = (Int(small_member3) ?? 0)
        sum4 = (Int(small_member4) ?? 0)
        sum  = sum1 + sum2 + sum3 + sum4
        return sum
    }
    
    private func checkSumLarge() -> Int{
        var sum  = 0
        var sum1 = 0
        var sum2 = 0
        var sum3 = 0
        var sum4 = 0
        sum1 = (Int(large_member1) ?? 0)
        sum2 = (Int(large_member2) ?? 0)
        sum3 = (Int(large_member3) ?? 0)
        sum4 = (Int(large_member4) ?? 0)
        sum  = sum1 + sum2 + sum3 + sum4
        return sum
    }
    
}

struct GolfView_Previews: PreviewProvider {
    static var previews: some View {
        GolfView()
    }
}
