import Foundation

class OpenAIHelper {
    static let shared = OpenAIHelper()
    
    private init() {}
    
    func askQuestion(_ question: String, completion: @escaping (String?, Error?) -> Void) {
        // Send the question to the OpenAI API and handle the response
        // You can use URLSession or any other networking library to make the API request
        
        // Example code using URLSession
        guard let url = URL(string: "https://api.openai.com/v1/ask") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer YOUR_API_KEY", forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "question": question,
            // Add any other required parameters for the API request
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            completion(nil, error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let answer = json?["answer"] as? String
                completion(answer, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
