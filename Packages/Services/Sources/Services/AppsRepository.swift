import Foundation
import Combine
import Models

public protocol AppsRepository {
    var apps: CurrentValueSubject<[App], Error> { get }

    func deleteApp(_ uuid: UUID)
}

public class RemoteAppsRepository: AppsRepository {

    public var apps = CurrentValueSubject<[App], Error>([])

    private let urlSession = URLSession(configuration: .default)

    private let baseUrl: URL

    public init(baseUrl: URL) {
        self.baseUrl = baseUrl

        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.loadApps()
            }
        }
    }

    private func loadApps() {
        let url = baseUrl.appendingPathComponent("apps")

        urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil else {
                print(String(describing: error?.localizedDescription))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                      print("Status Code different from 200")
                      return
                  }

            guard let data = data else {
                print("Missing data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedApps = try decoder.decode([App].self, from: data)
                self?.apps.send(decodedApps)
            } catch {
                //... whatever
            }
        }.resume()
    }

    public func deleteApp(_ uuid: UUID) {
        let url = baseUrl
            .appendingPathComponent("apps")
            .appendingPathComponent(uuid.uuidString)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        urlSession.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                print(String(describing: error?.localizedDescription))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                      print("Status Code different from 200")
                      return
                  }

            self.loadApps()

        }).resume()
    }
}
