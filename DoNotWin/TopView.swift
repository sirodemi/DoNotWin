//
//  TopView.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/08.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack {
            Text("thank you friends")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.bottom, 10.0)
            
            Text("don't win")
                .padding(.bottom, 30.0)
            
            Image("royal")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
