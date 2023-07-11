import Foundation

struct ExportValidationHelper {
    
    static func validateTimestamps(startTimestamp: Date, endTimestamp: Date) -> Bool {
        return startTimestamp < endTimestamp
    }
    
    static func validateExport(export: Export) -> Bool {
        return validateTimestamps(startTimestamp: export.startTimestamp, endTimestamp: export.endTimestamp)
    }
    
}
