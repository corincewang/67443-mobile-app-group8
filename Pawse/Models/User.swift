import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var email: String
    var nick_name: String
    var pets: [String] = []                 // ["pets/{id}", ...]
    var preferred_setting: [String] = []
}
