//
//  AddExpenses.swift
//  iExpense
//
//  Created by Mohit Soni on 27/05/22.
//

import SwiftUI

struct AddExpenses: View {
    
    @ObservedObject var expenses:Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @Environment(\.dismiss) var dismiss
    let types = ["Business","Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter name",text: $name)
                Picker("Type",selection: $type){
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount",value: $amount,format: .currency(code: "USD "))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expenses")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddExpenses_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenses(expenses: Expenses())
    }
}
