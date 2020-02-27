//
//  TotalView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/07.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI
import Combine

struct TotalView: View {
   @EnvironmentObject var toto: ViewModel
   @State private var totalPay1 = 0
   @State private var totalPay2 = 0
   @State private var totalPay3 = 0
   @State private var totalPay4 = 0
    
    
   var body: some View {
      VStack {
         // 背景イメーシ
         Image("royal")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 440, height: 80)
            .clipped()
            .offset(CGSize(width: 0, height: -120))

         Text("thank you friends")
            .font(.title)
            .fontWeight(.heavy)
            .offset(CGSize(width: 0, height: -30))
         Text("don't win")
            .font(.body)
            .offset(CGSize(width: 0, height: -30))

         HStack {
            Spacer(minLength: 10)
            Text(toto.memberList[toto.member1])
               .foregroundColor(.purple)
               .multilineTextAlignment(.center)
            Spacer()
            Text(toto.memberList[toto.member2])
               .foregroundColor(.blue)
               .multilineTextAlignment(.center)
            Spacer()
            Text(toto.memberList[toto.member3])
               .foregroundColor(.orange)
               .multilineTextAlignment(.center)
            Spacer()
            Text(toto.memberList[toto.member4])
               .foregroundColor(.green)
               .multilineTextAlignment(.center)
               Spacer(minLength: 10)
            }
            .font(.title)
            .padding(.bottom, 20.0)
            .offset(CGSize(width: 0, height: 50))
            
            VStack{
               HStack {
                 Text(" <Mahjang>")
                 Spacer()
               }
               .padding(.bottom, 10.0)
               .padding(.horizontal , 10.0)

               HStack {
                  Text("\(toto.mahjangPay1)")
                     .frame(width:90)
                     .foregroundColor(.purple)
                  Spacer()
                  Text("\(toto.mahjangPay2)")
                     .frame(width:90)
                     .foregroundColor(.blue)
                  Spacer()
                  Text("\(toto.mahjangPay3)")
                     .frame(width:90)
                     .foregroundColor(.orange)
                  Spacer()
                  Text("\(toto.mahjangPay4)")
                     .frame(width:90)
                     .foregroundColor(.green)
               }
               .font(Font.custom("AppleSDGothicNeo-UltraLight", size: 24.0))
               .multilineTextAlignment(.trailing)
               .padding(.all, 20)
            }
            .offset(CGSize(width: 0, height: 50))
            
         VStack{
            HStack {
               Text(" <Golf>")
               Spacer()
            }
            .padding(.bottom, 10.0)
            .padding(.horizontal , 10.0)

            HStack {
               Text("\(toto.golfPay1)")
                  .frame(width:90)
                  .foregroundColor(.purple)
               Spacer()
               Text("\(toto.golfPay2)")
                  .frame(width:90)
                  .foregroundColor(.blue)
               Spacer()
               Text("\(toto.golfPay3)")
                  .frame(width:90)
                  .foregroundColor(.orange)
               Spacer()
               Text("\(toto.golfPay4)")
                  .frame(width:90)
                  .foregroundColor(.green)
            }
            .font(Font.custom("AppleSDGothicNeo-UltraLight", size: 24.0))
            .multilineTextAlignment(.trailing)
            .padding(.all, 20)
         
         }
         .offset(CGSize(width: 0, height: 50))
            
         VStack{
            HStack {
               Text(" <Total>")
               Spacer()
            }
            .padding(.bottom, 10.0)
            .padding(.horizontal , 10.0)

            HStack {
               Text("\(totalPay1)")
                  .frame(width:90)
                  .foregroundColor(.purple)
               Spacer()
               Text("\(totalPay2)")
                  .frame(width:90)
                  .foregroundColor(.blue)
               Spacer()
               Text("\(totalPay3)")
                  .frame(width:90)
                  .foregroundColor(.orange)
               Spacer()
               Text("\(totalPay4)")
                  .frame(width:90)
                  .foregroundColor(.green)
            }
            .font(Font.custom("AppleSDGothicNeo-UltraLight", size: 24.0))
            .multilineTextAlignment(.trailing)
            .padding(.all, 20)
         }
         .offset(CGSize(width: 0, height: 50))
            
      }
      .onAppear(perform: calculate)
   }
    
   private func calculate() {
      totalPay1 = toto.mahjangPay1 + toto.golfPay1
      totalPay2 = toto.mahjangPay2 + toto.golfPay2
      totalPay3 = toto.mahjangPay3 + toto.golfPay3
      totalPay4 = toto.mahjangPay4 + toto.golfPay4
   }
}

struct TotalView_Previews: PreviewProvider {
   static var previews: some View {
      TotalView()
   }
}
