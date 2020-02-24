//
//  GolfView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/07.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI
//import Combine

struct GolfView: View {
    //他のViewとの共有変数[toto]
    @EnvironmentObject var toto: ViewModel
    
    //レートの選択肢
    @State var rate = [10,50,100,300,500,1000]
    
    //初期設定レート
    @State var smallRate  = 2
    @State var largeRate = 4
    
    //小丸ポイントを格納する変数
    @State var small_member1 = ""
    @State var small_member2 = ""
    @State var small_member3 = ""
    @State var small_member4 = ""
    
    //小丸ポイントを分配した結果を格納する変数
    @State var small_distribution1 = 0
    @State var small_distribution2 = 0
    @State var small_distribution3 = 0
    @State var small_distribution4 = 0
    
    //大丸ポイントを格納する変数
    @State var large_member1 = ""
    @State var large_member2 = ""
    @State var large_member3 = ""
    @State var large_member4 = ""
    
    //計算間違いを検算する為の変数
    @State var small_difference = 0
    @State var large_difference = 0
    
    var body: some View {
        ZStack {
            //画面上部の隅まで表示する
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                /*--------------------------------
                小丸のレートの変数[smallRate]
                --------------------------------*/
                HStack{
                    Text("Small Rate").font(.body)
                    Picker("Numbers",selection: $smallRate) {
                        ForEach(0 ..< rate.count) { index in
                            Text("\(self.rate[index])").tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .frame(width: 350.0)
                .offset(CGSize(width: 0, height: -150))
                
                /*--------------------------------
                大丸のレートの変数[largeRate]
                --------------------------------*/
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
                
                /*--------------------------------
                タイトル
                --------------------------------*/
                Text("golf")
                    .font(.title)
                    .fontWeight(.heavy)
                    .offset(CGSize(width: 0, height: -100))
                Text("don't win")
                    .font(.body)
                    .offset(CGSize(width: 0, height: -100))
                
                /*--------------------------------
                ポイント検算用
                --------------------------------*/
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
                
                /*--------------------------------
                メンバー表示
                --------------------------------*/
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
                
                /*---------------------------------------------------------
                小丸のポイント格納[small_member1〜4]
                入力と同時に検算結果を表示する
                ---------------------------------------------------------*/
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
                
                /*---------------------------------------------------------
                大丸のポイント格納[large_member1〜4]
                 入力と同時に検算結果を表示する
                ----------------------------------------------------------*/
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
                
                /*-------------------------------------------------------
                自作関数[calc]で小丸と大丸の合計をして結果を表示する(argは引数)
                --------------------------------------------------------*/
                HStack{
                    Spacer(minLength: 10)
                    Text("\(calc(arg1: (small_distribution1), arg2: (Int(large_member1) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (small_distribution2), arg2: (Int(large_member2) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (small_distribution3), arg2: (Int(large_member3) ?? 0)))")
                        .frame(width:90)
                    Spacer()
                    Text("\(calc(arg1: (small_distribution4), arg2: (Int(large_member4) ?? 0)))")
                        .frame(width:90)
                    Spacer(minLength: 10)
                }
                .offset(CGSize(width: 0, height: -50))
                .font(Font.custom("AppleSDGothicNeo-UltraLight", size: 24.0))
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.numbersAndPunctuation)
            
        /*----------------------------------------------------
        画面を離れる時に[toto]共有変数に結果を持たせる
        ----------------------------------------------------*/
        .onDisappear(perform:  calculate)
    }
    
    /*--------------------------------
    小丸と大丸の合計値を返す
    --------------------------------*/
    private func calc(arg1: Int, arg2: Int) -> Int{
        let answer = arg1 * rate[smallRate]  + arg2 * rate[largeRate]
        return answer
    }
    
    /*--------------------------------
    円への換算
    --------------------------------*/

    private func calculate() {
        var smallPay = 0
        var largePay = 0
        smallPay = small_distribution1 * rate[smallRate]
        largePay = ((Int(large_member1) ?? 0) * rate[largeRate] )
        toto.golfPay1 = smallPay + largePay
        
        smallPay = small_distribution2 * rate[smallRate]
        largePay = ((Int(large_member2) ?? 0) * rate[largeRate] )
        toto.golfPay2 = smallPay + largePay
        
        smallPay = small_distribution3 * rate[smallRate]
        largePay = ((Int(large_member3) ?? 0) * rate[largeRate] )
        toto.golfPay3 = smallPay + largePay
        
        smallPay = small_distribution4 * rate[smallRate]
        largePay = ((Int(large_member4) ?? 0) * rate[largeRate] )
        toto.golfPay4 = smallPay + largePay
    }
    
    /*--------------------------------
    小丸の４人の分配の計算
    --------------------------------*/
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
        small_distribution1 = sum1 * 4 - sum
        small_distribution2 = sum2 * 4 - sum
        small_distribution3 = sum3 * 4 - sum
        small_distribution4 = sum4 * 4 - sum
        return 0
    }
    
    /*--------------------------------
    大丸の４人の合計の検算
    --------------------------------*/
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
