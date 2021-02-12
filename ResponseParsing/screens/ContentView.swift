//
//  ContentView.swift
//  ResponseParsing
//
//  Created by Зехниддин on 12/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = EmployeeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.employees, id: \.id) { item in
                    HStack(alignment: .center, spacing: 14) {
                        VStack(spacing: 4) {
                            Image("im_user")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(-10)
                                .cornerRadius(20)
                            Text("Id: ") + Text(item.id!).fontWeight(.semibold)
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Name: ") + Text(item.employee_name!).fontWeight(.semibold)
                            Text("Salary: ") + Text(item.employee_salary! + "$").fontWeight(.semibold)
                            Text("Age: ") + Text(item.employee_age! + " years old").fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                }
                .listStyle(PlainListStyle())
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("Employees", displayMode: .inline)
        }
        .onAppear {
            self.viewModel.apiEmployeeList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
