# Realm Java Local - Changelog

## Version 11.0.0-local (2024-12-19)

### 🎯 **Local-Only Transformation**

Transformed Realm Java into a **local-only database library** by removing all deprecated sync functionality.

### ✅ **What's Preserved**
- **Local Database**: Complete CRUD operations
- **RealmObject & RealmModel**: Object modeling
- **Queries**: RealmQuery with filtering and sorting
- **Collections**: RealmList, RealmSet, RealmMap
- **Relationships**: One-to-one, one-to-many, many-to-many
- **Schema Management**: Migrations and versioning
- **Encryption**: AES-256 encryption support
- **Threading**: Thread-safe operations
- **RxJava**: Reactive programming
- **Kotlin Coroutines**: Async/await support
- **JSON**: Import/export functionality

### ❌ **What's Removed**
- **Atlas Device Sync**: Real-time synchronization
- **MongoDB Integration**: App Services, Functions
- **Authentication**: User management, OAuth
- **Network Features**: HTTP client, push notifications
- **Sync Configuration**: SyncConfiguration class
- **Client Reset**: Sync conflict resolution

### 📦 **New Coordinates**
```gradle
implementation 'io.realm.local:realm-android-library-local:11.0.0-local'
kapt 'io.realm:realm-annotations-processor:11.0.0-local'
```

### 🚀 **Benefits**
- **Smaller APK**: ~2MB reduction
- **Faster Builds**: No sync native compilation
- **Privacy-First**: All data stays local
- **Offline-First**: No network dependencies
- **Simplified**: Fewer dependencies

### 🔧 **Migration**
See [MIGRATION_GUIDE.md](MIGRATION_GUIDE.md) for step-by-step migration instructions.

---

**Perfect for**: File creation, data export, offline-first apps, and any use case requiring local-only database operations.