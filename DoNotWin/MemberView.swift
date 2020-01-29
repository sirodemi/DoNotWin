//
//  MemberView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/07.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI
import Combine

struct MemberView: View {
    @EnvironmentObject var toto: ViewModel
    
    var body: some View {
        
        VStack {
            // 背景イメーシ
            Image("royal")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 440, height: 80)
                .clipped()
                .offset(CGSize(width: 0, height: -120))
            

            Text("member list")
                .font(.title)
                .fontWeight(.heavy)
      //          .padding(.bottom, 10.0)
                .offset(CGSize(width: 0, height: -30))
            Text("don't win")
                .font(.body)
     //           .padding(.bottom, 120.0)
                .offset(CGSize(width: 0, height: -30))
        
            HStack {
                VStack{
                    Text(toto.memberList[toto.member1])
                        .font(.title)
                        .foregroundColor(.purple)
                        .padding(.bottom, 30.0)

                    Picker(selection: $toto.member1, label: Text("")) {
                        ForEach(0..<toto.memberList.count){
                            index in
                            Text(self.toto.memberList[index]).tag(index)
                        }
                    }
                    .frame(width:80)
                    .border(Color.purple)
                    .clipped()
                    
                }
                
                VStack{
                    Text(toto.memberList[toto.member2])
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.bottom, 30.0)
                    
                    Picker(selection: $toto.member2, label: Text("")) {
                        ForEach(0..<toto.memberList.count){
                            index in
                            Text(self.toto.memberList[index]).tag(index)
                        }
                    }
                    .frame(width:80)
                    .border(Color.blue)
                    .clipped()
                }
                
                VStack{
                    Text(toto.memberList[toto.member3])
                        .font(.title)
                        .foregroundColor(.orange)
                        .padding(.bottom, 30.0)
                    
                    Picker(selection: $toto.member3, label: Text("")) {
                        ForEach(0..<toto.memberList.count){
                            index in
                            Text(self.toto.memberList[index]).tag(index)
                        }
                    }
                    .frame(width:80)
                    .border(Color.orange)
                    .clipped()
                }
                
                VStack{
                    Text(toto.memberList[toto.member4])
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.bottom, 30.0)
                    
                    Picker(selection: $toto.member4, label: Text("")) {
                        ForEach(0..<toto.memberList.count){
                            index in
                            Text(self.toto.memberList[index]).tag(index)
                        }
                    }
                    .frame(width:80)
                    .border(Color.green)
                    .clipped()
                }
            }
        }
 //       .padding(.bottom, 100.0)
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView()
    }
}
