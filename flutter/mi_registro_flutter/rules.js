rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /registros/{registroId} {
      allow read, write: if request.time < timestamp.date(2026, 11, 11);
    }
  }
}
