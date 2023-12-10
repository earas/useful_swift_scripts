import Foundation

func extractIPsFromFile(filePath: String) {
    // Regular expression pattern for matching IP addresses
    let ipPattern = "\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b"

    do {
        // Reading the content of the file
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)

        // Regular expression setup
        let regex = try NSRegularExpression(pattern: ipPattern, options: [])

        // Extracting IP addresses from each line
        for line in lines {
            let range = NSRange(location: 0, length: line.utf16.count)
            let matches = regex.matches(in: line, options: [], range: range)
            
            // Print each IP address found
            for match in matches {
                if let range = Range(match.range, in: line) {
                    let ip = String(line[range])
                    print(ip)
                }
            }
        }
    } catch let error as NSError {
        print("An error occurred: \(error.localizedDescription)")
    }
}

// Example usage
// Replace '/path/to/your/file.txt' with the path to your file
let filePath = "/path/to/your/file.txt"
extractIPsFromFile(filePath: filePath)
