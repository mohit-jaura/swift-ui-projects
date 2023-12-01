//
//  ContentView.swift
//  iExpense
//
//  Created by Mohit Soni on 27/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpensesView = false
    var body: some View {
        NavigationView{
                List{
                    ForEach(expenses.items){ item in
                        HStack{
                            VStack(alignment:.leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text(item.amount,format: .currency(code: "USD"))
                        }
                    }
                    .onDelete(perform: removeRows(at:))
                }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    showingAddExpensesView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpensesView) {
                AddExpenses(expenses: expenses)
            }
        }
    }
    
    func removeRows(at offset:IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
