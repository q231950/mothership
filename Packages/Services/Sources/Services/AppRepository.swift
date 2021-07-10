import Foundation
import Combine
import Models

public protocol AppRepository {
    var uploads: CurrentValueSubject<[Upload], Error> { get }

    func delete(_ uuid: UUID)
}

public class RemoteAppRepository: AppRepository {

    public var uploads = CurrentValueSubject<[Upload], Error>([])

    private let urlSession = URLSession(configuration: .default)

    private let baseUrl: URL

    /// The app's UUID
    private let uuid: UUID

    public init(baseUrl: URL, uuid: UUID) {
        self.baseUrl = baseUrl
        self.uuid = uuid

        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.loadUploads()
            }
        }
    }

    public func delete(_ uuid: UUID) {
        let url = baseUrl
            .appendingPathComponent("uploads")
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

            self.loadUploads()

        }).resume()
    }

    /// The Uploads of the ``App``
    private func loadUploads() {
        let url = baseUrl
            .appendingPathComponent("apps")
            .appendingPathComponent(uuid.uuidString)
            .appendingPathComponent("builds")

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
                let decodedUploads = try decoder.decode([Upload].self, from: data)
                self?.uploads.send(decodedUploads)
            } catch {
                //... whatever
            }
        }.resume()
    }

}
