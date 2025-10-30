import Firebase
import FirebaseFirestore

final class FirebaseManager {
    static let shared = FirebaseManager()
    let auth: Auth
    let db: Firestore

    private init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.db = Firestore.firestore()
        self.functions = Functions.functions()
    }
}
