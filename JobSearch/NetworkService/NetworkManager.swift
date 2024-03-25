import Foundation

class ServiceLayer {

    static let shared = ServiceLayer()
    init(){}
    func fetchDataFirstViewHotel() async throws -> Job {
        return try await withCheckedThrowingContinuation { continuation in
            let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14")!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let jsonData = data,
                          let posts = try? JSONDecoder().decode(Job.self, from: jsonData) {
                    continuation.resume(returning: posts)
                } else {
                    assertionFailure("Error from get request")
                }
            }.resume()
        }
    }
}
