import Foundation

typealias json = [String: Any]

class LottieService {
    
    class func fetchLottieFile(url: String, completion: @escaping (json) -> Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if let data = data {
                if let object = try? JSONSerialization.jsonObject(with: data, options: []) as! json {
                    if let urlString = object["url"] as? String {
                        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
                            if let data = data, let lottieJson = try? JSONSerialization.jsonObject(with: data, options: []) as! json {
                                completion(lottieJson)
                            }
                        }).resume()
                    }
                }
            }
        }.resume()
    }
}
