    import Moya
    import Foundation

    enum Api {
        case getMe
        case login(username: String, password: String)
        case reissueToken(refreshToken: String)
        case signup(username: String, password: String, studentId: String, realName: String, schoolId: Int)
        case getTodayMeal(today: Date)
        case getExercises
    }

    extension Api: TargetType {
        var baseURL: URL {
            switch self {
    
            default: return URL(string: "http://43.203.235.45:8080")!
            }
            
        }
        
        var path: String {
            switch self {
            case .getMe:
                return "/users/me"
            case .login:
                return "/auth/login"
            case .signup:
                return "/auth/signup"
            case .reissueToken:
                return "/auth/reissue"
            case .getTodayMeal(let today):
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                formatter.timeZone = TimeZone(secondsFromGMT: 0) 
                let dateString = formatter.string(from: today)
                return "/mealMenu/daily/\(dateString)"
            case .getExercises:
                return "/exercises"
            }
        }
        
        var method: Moya.Method {
            switch self {
            case .getMe, .getTodayMeal, .getExercises:
                return .get
            case .login, .reissueToken, .signup:
                return .post
            }
        }
        
        var task: Task {
            switch self {
            case .getMe, .getTodayMeal,.getExercises:
                return .requestPlain
                
            case .login(let username, let password):
                return .requestParameters(
                    parameters: [
                        "username": username,
                        "password": password
                    ], encoding: JSONEncoding.default)
                
            case .signup(username: let username, password: let password, studentId: let studentId, realName: let realName, schoolId: let schoolId):
                return .requestParameters(
                    parameters: [
                        "username": username,
                        "password": password,
                        "studentId": studentId,
                        "realName": realName,
                        "schoolId": schoolId
                    ], encoding: JSONEncoding.default)
                
            case .reissueToken(let refreshToken):
                return .requestParameters(
                    parameters: [
                        "refreshToken": refreshToken
                    ],
                    encoding: JSONEncoding.default)
            }
        }
        
        var headers: [String: String]? {
            var headers = ["Content-Type": "application/json"]
            if let token = UserDefaults.standard.string(forKey: "accessToken") {
//                headers["Authorization"] = "Bearer \(token)"
                headers["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdHJpbmciLCJ0eXBlIjoiQUNDRVNTIiwiaWF0IjoxNzU1NzU3NjkyLCJleHAiOjE3NTU3NjEyOTJ9.rjK4p0MEGAd8Bt6rmZFusvo2mmY_i86q0W-fRow-8gdPC2I1vNYLr8blXDwETkYYHOfybsFuw4JKiwf8aoJdKg"
            }
            return headers
        }

    }

