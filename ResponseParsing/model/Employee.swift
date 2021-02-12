//
//  Employee.swift
//  ResponseParsing
//
//  Created by Зехниддин on 12/02/21.
//

import Foundation

struct Employee: Decodable {
    var status: String?
    var data: [Data]
}

struct Data: Decodable {
    var employee_age: String?
    var employee_name: String?
    var employee_salary: String?
    var id: String?
    var profile_image: String?
}
