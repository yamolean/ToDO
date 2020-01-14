//
//  ContentView.swift
//  swiftuiFirebase
//
//  Created by 矢守叡 on 2020/01/14.
//  Copyright © 2020 yamolean. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body : some View {
        HStack {
            Spacer()
            Button("編集") {
            }
        }
    }
}

struct BottomButtonView: View {
    @State var isPresented: Bool = false
    var body : some View {
        HStack {
            Spacer()
            Button("編集") {
                self.isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                ToDOEditView(expenses: Expenses())
            }
        }
    }
}

struct ExpenseItem: Identifiable {
    let id = UUID()
    let text: String
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses.items) { item in
                        Section(header: HeaderView()) {
                            Text(item.text)
                                .font(.title)
                        }
                    }
                }
                BottomButtonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
