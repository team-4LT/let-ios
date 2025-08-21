//
//  CustomTextField.swift
//  let
//
//  Created by 민덕 on 6/25/25.
//

import SwiftUI


struct CustomTextField: TextFieldStyle {
    var focused: FocusState<Bool>.Binding
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(focused.wrappedValue ? Color(hex: "FF3939") : Color.grey, lineWidth: 1)
            .frame(height: 69)
            .hideKeyBoard()
            .overlay {
                configuration
                    .padding()
                    .focused(focused)
            }
    }
}
    //TextField(text: $username, label: { Text("아이디") })
    //    .padding()
    //    .overlay(RoundedRectangle(cornerRadius: 12).stroke(isUsernameFocused ? Color(hex: "FF3939") : Color.grey, lineWidth: 1))
    //    .hideKeyBoard()
    //    .focused($isUsernameFocused)
    //    .tint(Color(hex: "FF3939"))
    //    .autocapitalization(.none)
