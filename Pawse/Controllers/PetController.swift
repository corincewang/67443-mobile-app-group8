// CRUD pets, cascading deletes
import FirebaseFirestore

final class PetController {
    private let db = FirebaseManager.shared.db

    func createPet(_ pet: Pet) async throws {
        try await db.collection(Collection.pets).addDocument(from: pet)
    }

    func fetchPets(for user: String) async throws -> [Pet] {
        let snap = try await db.collection(Collection.pets)
            .whereField("owner", isEqualTo: "users/\(user)").getDocuments()
        return try snap.documents.compactMap { try $0.data(as: Pet.self) }
    }

    func deletePet(petId: String) async throws {
        try await db.collection(Collection.pets).document(petId).delete()
    }
}
