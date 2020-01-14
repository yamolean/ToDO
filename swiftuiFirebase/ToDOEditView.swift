//
//  ToDOEditView.swift
//  swiftuiFirebase
//
//  Created by 矢守叡 on 2020/01/14.
//  Copyright © 2020 yamolean. All rights reserved.
//

import SwiftUI

struct ToDOEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var text = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("text",text: $text)
                    .frame(width: 50, height: 50)
                Spacer()
            }
            Button("保存する") {
                let item = ExpenseItem(text: self.text)
                self.expenses.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

struct UserEditView_Previews: PreviewProvider {
    static var previews: some View {
        ToDOEditView(expenses: Expenses())
    }
}
