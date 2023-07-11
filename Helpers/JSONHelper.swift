import Foundation

class JSONHelper {
    static func encode<T: Encodable>(_ value: T) -> Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(value)
            return data
        } catch {
            print("Failed to encode data: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let value = try decoder.decode(type, from: data)
            return value
        } catch {
            print("Failed to decode data: \(error.localizedDescription)")
            return nil
        }
    }
}
