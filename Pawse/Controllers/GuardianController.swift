// guardian requests, approval
import FirebaseFirestore

final class GuardianController {
    private let db = FirebaseManager.shared.db

    func requestCoOwner(for petId: String, guardianRef: String, ownerRef: String) async throws {
        let doc = CoOwner(date_added: Date(), guardian: guardianRef, owner: ownerRef,
                          pet: "pets/\(petId)", status: "pending")
        try await db.collection(Collection.coowners).addDocument(from: doc)
    }

    func approveCoOwner(requestId: String) async throws {
        try await db.collection(Collection.coowners).document(requestId)
            .updateData(["status": "approved"])
    }

    func fetchCoOwners(for petId: String) async throws -> [CoOwner] {
        let snap = try await db.collection(Collection.coowners)
            .whereField("pet", isEqualTo: "pets/\(petId)").getDocuments()
        return try snap.documents.compactMap { try $0.data(as: CoOwner.self) }
    }
}
