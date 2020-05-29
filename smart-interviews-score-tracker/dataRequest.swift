import Foundation

struct codeforcesDataRequest {
    let requestUrl: URL
    
    init(url: String){
        self.requestUrl = URL(string: url)!
    }
    func getCodeforcesData(completionHandler: @escaping(Result<codeforcesRoot, Error>) -> Void) {

        URLSession.shared.dataTask(with: self.requestUrl) { (data,response, error) in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            do {
//                print("Fetching Code Forces Data")
                 let codeforcesDataresponse = try JSONDecoder().decode(codeforcesRoot.self, from: data)
                 completionHandler(.success(codeforcesDataresponse))
            }
            catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}

struct interviewbitDataRequest {
    let requestUrl: URL
    
    init(url: String){
        self.requestUrl = URL(string: url)!
    }
    func getinterviewbitData(completionHandler: @escaping(Result<interviewbitRoot, Error>) -> Void) {

        URLSession.shared.dataTask(with: self.requestUrl) { (data,response, error) in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            do {
//                print("Fetching Interview Bit Data")
                 let interviewbitDataresponse = try JSONDecoder().decode(interviewbitRoot.self, from: data)
                 completionHandler(.success(interviewbitDataresponse))
            }
            catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}

struct codechefDataRequest {
    let requestUrl: URL
    
    init(url: String){
        self.requestUrl = URL(string: url)!
    }
    func getinterviewbitData(completionHandler: @escaping(Result<codechefRoot, Error>) -> Void) {

        URLSession.shared.dataTask(with: self.requestUrl) { (data,response, error) in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            do {
//                print("Fetching Code Chef Data")
                 let codechefDataresponse = try JSONDecoder().decode(codechefRoot.self, from: data)
                 completionHandler(.success(codechefDataresponse))
            }
            catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}

struct spojDataRequest {
    let requestUrl: URL
    
    init(url: String){
        self.requestUrl = URL(string: url)!
    }
    func getspojData(completionHandler: @escaping(Result<spojRoot, Error>) -> Void) {

        URLSession.shared.dataTask(with: self.requestUrl) { (data,response, error) in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            do {
//                print("Fetching SPOJ Data")
                 let spojDataresponse = try JSONDecoder().decode(spojRoot.self, from: data)
                 completionHandler(.success(spojDataresponse))
            }
            catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}
