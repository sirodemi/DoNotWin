//
//  NumberTextField.swift
//  practice_toto
//
//  Created by ShiroIbi on 2020/01/08.
//  Copyright © 2020 sunyou. All rights reserved.
//

import SwiftUI

struct NumberTextField: View {
    var title:String
    @Binding var number:String
    var body: some View {
        
        HStack {
            Text(title + "")
            TextField("0",text: $number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numbersAndPunctuation)
                .multilineTextAlignment(.trailing)
        }.frame(width: 90)
        
    }
}

struct NumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextField(title: "", number: .constant("123"))
    }
}
