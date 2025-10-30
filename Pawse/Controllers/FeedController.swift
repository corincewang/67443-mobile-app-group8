// join contests, get daily top3
// will call internal api!
// consider splitting this into 2 controllers?
// dmumy implementation routing to render api for now 
import Foundation

final class FeedController {
    static let baseURL = URL(string: "https://pawse-api-temp.onrender.com/api")!

    enum FeedError: Error { case invalidResponse }

    func fetchFriendsFeed() async throws -> [Photo] {
        try await fetch(endpoint: "friends-feed")
    }

    func fetchContestFeed() async throws -> [ContestPhoto] {
        try await fetch(endpoint: "contest-feed")
    }

    func fetchLeaderboard() async throws -> [ContestPhoto] {
        try await fetch(endpoint: "leaderboard")
    }

    private func fetch<T: Decodable>(endpoint: String) async throws -> [T] {
        let url = Self.baseURL.appendingPathComponent(endpoint)
        let (data, resp) = try await URLSession.shared.data(from: url)
        guard (resp as? HTTPURLResponse)?.statusCode == 200 else { throw FeedError.invalidResponse }
        return try JSONDecoder().decode([T].self, from: data)
    }
}
