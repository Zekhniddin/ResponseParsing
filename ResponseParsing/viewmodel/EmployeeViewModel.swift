

import Foundation

class EmployeeViewModel: ObservableObject {
    @Published var employees = [Data]()
    @Published var isLoading = false
    @Published var isCreated = false
    @Published var isUpdated = false
    @Published var isDeleted = false
    
    func apiEmployeeList() {
        self.isLoading = true
        AFHttp.get(url: AFHttp.API_EMPLOYEE_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                self.employees = (try! JSONDecoder().decode(Employee.self, from: response.data!)).data
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiEmployeeSingle(id: Int) {
        self.isLoading = true
        AFHttp.get(url: AFHttp.API_EMPLOYEE_SINGLE + String(id), params: AFHttp.paramsEmpty(), handler: {response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiEmployeeCreate(employee: Data) {
        AFHttp.post(url: AFHttp.API_EMPLOYEE_CREATE, params: AFHttp.paramsEmployeeCreate(employee: employee), handler: {response in
            switch response.result {
            case .success:
                print(response.result)
                self.isCreated = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiEmployeeUpdate(employee: Data) {
        AFHttp.put(url: AFHttp.API_EMPLOYEE_UPDATE + String(employee.id!), params: AFHttp.paramsEmployeeUpdate(employee: employee), handler: {response in
            switch response.result {
            case .success:
                print(response.result)
                self.isUpdated = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiEmployeeDelete(employee: Data) {
        AFHttp.del(url: AFHttp.API_EMPLOYEE_DELETE + String(employee.id!), params: AFHttp.paramsEmpty(), handler: {response in
            switch response.result {
            case .success:
                print(response.result)
                self.isDeleted = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
}
