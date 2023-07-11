import Foundation

class NetworkingHelper {
    
    func sendRequest(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }
        task.resume()
    }
    
    func postRequest(url: URL, body: Data, completion: @escaping (Data?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        task.resume()
    }
    
    func downloadFile(url: URL, completion: @escaping (URL?, Error?) -> Void) {
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (tempURL, response, error) in
            if let tempURL = tempURL {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let destinationURL = documentsDirectory?.appendingPathComponent(url.lastPathComponent)
                
                do {
                    try FileManager.default.moveItem(at: tempURL, to: destinationURL!)
                    completion(destinationURL, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}

