
import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "http://dummy.restapiexample.com/"
private let DEV_SER = "http://dummy.restapiexample.com/"

let headers: HTTPHeaders = [:]

class AFHttp {
    
    // MARK : - AFHttp Requests
    
    class func get(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .get, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func post(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .post, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func put(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .put, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func del(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .delete, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    // MARK : - AFHttp Methods
    class func server(url: String) -> URL{
        if(IS_TESTER){
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    
    // MARK : - AFHttp Apis
    static let API_EMPLOYEE_LIST = "api/v1/employees"
    static let API_EMPLOYEE_SINGLE = "api/v1/employee/1" //id
    static let API_EMPLOYEE_CREATE = "api/v1/create"
    static let API_EMPLOYEE_UPDATE = "api/v1/update/21" //id
    static let API_EMPLOYEE_DELETE = "api/v1/delete/2" //id

    // MARK : - AFHttp Params
    class func paramsEmpty() -> Parameters {
        let parameters: Parameters = [:]
        return parameters
    }
    
    class func paramsEmployeeCreate(employee: Data) -> Parameters {
        let parameters: Parameters = [
            "name": employee.employee_name!,
            "salary": employee.employee_salary!,
            "age": employee.employee_age!
        ]
        return parameters
    }
    
    class func paramsEmployeeUpdate(employee: Data) -> Parameters {
        let parameters: Parameters = [
            "id": employee.id!,
            "name": employee.employee_name!,
            "salary": employee.employee_salary!,
            "age": employee.employee_age!
        ]
        return parameters
    }
    
}
