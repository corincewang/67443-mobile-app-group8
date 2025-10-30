// S3 upload and Firestore photo writes
import FirebaseFirestore
import FirebaseFunctions

final class PhotoController {
    private let db = FirebaseManager.shared.db
    private let functions = FirebaseManager.shared.functions

    func requestPresignedURL(petId: String, mimeType: String, ext: String) async throws -> (URL, String) {
        let res = try await functions.httpsCallable("getPresignedUploadUrl")
            .call(["petId": petId, "mimeType": mimeType, "ext": ext, "contentLength": 0])
        let data = res.data as! [String: Any]
        return (URL(string: data["uploadUrl"] as! String)!, data["s3Key"] as! String)
    }

    func savePhotoRecord(photo: Photo) async throws {
        try await db.collection(Collection.photos).addDocument(from: photo)
    }

    func deletePhoto(photoId: String) async throws {
        try await db.collection(Collection.photos).document(photoId).delete()
    }
}
