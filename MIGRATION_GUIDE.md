# Migration Guide: Realm Java to Realm Java Local

## Quick Changes

### Dependencies
**Before:**
```gradle
implementation 'io.realm:realm-android-library-object-server:11.0.0'
```

**After:**
```gradle
implementation 'io.realm.local:realm-android-library-local:11.0.0-local'
kapt 'io.realm:realm-annotations-processor:11.0.0-local'
```

### Configuration
**Before (SyncConfiguration):**
```java
App app = new App("your-app-id");
User user = app.currentUser();
SyncConfiguration config = new SyncConfiguration.Builder(user, "partition")
    .build();
```

**After (RealmConfiguration):**
```java
RealmConfiguration config = new RealmConfiguration.Builder()
    .name("my-database.realm")
    .build();
```

### Remove Sync Code
Remove all imports and usage of:
- `io.realm.mongodb.*`
- `SyncConfiguration`
- `App`, `User`, `Credentials`
- Authentication code

### What Still Works
- All RealmObject operations
- RealmQuery and RealmResults
- Collections (RealmList, RealmSet, RealmMap)
- Encryption, threading, RxJava, Coroutines
- JSON import/export
- Schema migrations

## For File Transfer Use Cases

Create and export Realm files:
```java
// Create Realm file
RealmConfiguration config = new RealmConfiguration.Builder()
    .name("export-data.realm")
    .build();

Realm realm = Realm.getInstance(config);
// Populate data...
realm.close();

// Send file via REST
File realmFile = new File(context.getFilesDir(), "export-data.realm");
// Upload realmFile
```

Or export as JSON:
```java
RealmResults<MyObject> data = realm.where(MyObject.class).findAll();
String json = realm.copyFromRealm(data).toString();
// Send JSON via REST
```