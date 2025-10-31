# Realm Java Local

> [!NOTE]
> This is a community-maintained fork of Realm Java focused on local database functionality only.
> All deprecated sync features have been removed to create a lightweight, local-only database solution.

<picture>
    <source srcset="./media/logo-dark.svg" media="(prefers-color-scheme: dark)" alt="realm">
    <img src="./media/logo.svg" alt="realm">
</picture>

[![Maven Central](https://img.shields.io/maven-central/v/io.realm/realm-gradle-plugin?colorB=4dc427&label=Maven%20Central)](https://search.maven.org/artifact/io.realm/realm-gradle-plugin)
[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/realm/realm-java/blob/master/LICENSE)

Realm Java Local is a mobile database that runs directly inside Android devices.
This repository contains a streamlined version of Realm Java with all sync functionality removed, focusing purely on local database operations.

## Features

* **Mobile-first:** Built from the ground up to run directly inside Android devices
* **Simple:** Data is directly exposed as objects and queryable by code, removing the need for ORMs
* **Modern:** Supports easy thread-safety, relationships & encryption
* **Fast:** Faster than raw SQLite on common operations
* **Local-only:** No sync dependencies, perfect for offline-first applications

## Getting Started

### Installation

Add Realm Java Local to your Android project:

```gradle
dependencies {
    implementation 'io.realm.local:realm-android-library-local:11.0.0-local'
    kapt 'io.realm:realm-annotations-processor:11.0.0-local'
}
```

Apply the Realm plugin:

```gradle
apply plugin: 'realm-android'
```

### Basic Usage

```java
// Define your model
public class User extends RealmObject {
    private String name;
    private int age;
    // getters and setters
}

// Use Realm
Realm realm = Realm.getDefaultInstance();
realm.beginTransaction();
User user = realm.createObject(User.class);
user.setName("John Doe");
user.setAge(30);
realm.commitTransaction();

// Query data
RealmResults<User> users = realm.where(User.class)
    .greaterThan("age", 18)
    .findAll();
```

## What's Included

All core local database features:

- **Local Database**: Full CRUD operations
- **Queries**: Complex queries with sorting and filtering
- **Relationships**: One-to-one, one-to-many, many-to-many
- **Collections**: RealmList, RealmSet, RealmMap
- **Encryption**: AES-256 encryption support
- **Threading**: Thread-safe operations
- **Migrations**: Schema migration support
- **RxJava**: Reactive programming support
- **Kotlin Coroutines**: Async/await support
- **JSON Import/Export**: Data serialization

## What's Removed

All deprecated sync functionality has been removed:

- **Device Sync**: All Atlas Device Sync features
- **MongoDB Integration**: App Services, Functions, Authentication
- **Real-time Sync**: Multi-device synchronization
- **Cloud Features**: All cloud-dependent functionality

## Getting Help

- **Got a question?**: Check the examples in the `examples/` directory
- **Think you found a bug?** Open an issue in this repository
- **Have a feature request?** Open an issue describing the local database feature you'd like

> **Note**: This is a community-maintained fork. For questions about the original Realm Java with sync features, please refer to the [official Realm documentation](https://www.mongodb.com/docs/atlas/device-sdks/sdk/java/).

## Building from Source

To build Realm Java Local:

```bash
git clone https://github.com/your-username/realm-java-local.git
cd realm-java-local
./build-local.sh
```

This builds and installs the library to your local Maven repository.

## Building Realm

In case you don't want to use the precompiled version, you can build Realm yourself from source.

### Prerequisites

 * Download the [**JDK 8**](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) from Oracle and install it.
 * The latest stable version of Android Studio. Currently [4.1.1](https://developer.android.com/studio/).
 * Download & install the Android SDK **Build-Tools 29.0.3**, **Android Pie (API 29)** (for example through Android Studio’s **Android SDK Manager**).
 * Install CMake version 3.18.4 and build Ninja.
 * Install the NDK (Side-by-side) **21.0.6113669** from the SDK Manager in Android Studio. Remember to check `☑  Show package details` in the manager to display all available versions.

 * Add the Android home environment variable to your profile:

    ```
    export ANDROID_HOME=~/Library/Android/sdk
    ```

 * If you are launching Android Studio from the macOS Finder, you should also run the following command:

    ```
    launchctl setenv ANDROID_HOME "$ANDROID_HOME"
    ```

 * If you'd like to specify the location in which to store the archives of Realm Core, define the `REALM_CORE_DOWNLOAD_DIR` environment variable. It enables caching core release artifacts.

   ```
   export REALM_CORE_DOWNLOAD_DIR=~/.realmCore
   ```

   macOS users must also run the following command for Android Studio to see this environment variable.

   ```
   launchctl setenv REALM_CORE_DOWNLOAD_DIR "$REALM_CORE_DOWNLOAD_DIR"
   ```

It would be a good idea to add all of the symbol definitions (and their accompanying `launchctl` commands, if you are using macOS) to your `~/.profile` (or `~/.zprofile` if the login shell is `zsh`)

 * If you develop Realm Java with Android Studio, we recommend you to exclude some directories from indexing target by executing following steps on Android Studio. It really speeds up indexing phase after the build.

    - Under `/realm/realm-library/`, select `build`, `.cxx` and `distribution` folders in `Project` view.
    - Press `Command + Shift + A` to open `Find action` dialog. If you are not using default keymap nor using macOS, you can find your shortcut key in `Keymap` preference by searching `Find action`.
    - Search `Excluded` (not `Exclude`) action and select it. Selected folder icons should become orange (in default theme).
    - Restart Android Studio.

### Download sources

You can download the source code of Realm Java by using git. Since realm-java has git submodules, use `--recursive` when cloning the repository.

```
git clone git@github.com:realm/realm-java.git --recursive
```

or

```
git clone https://github.com/realm/realm-java.git --recursive
```

### Build

Once you have completed all the pre-requisites building Realm is done with a simple command.

```
./gradlew assemble
```

That command will generate:

 * a jar file for the Realm Gradle plugin
 * an aar file for the Realm library
 * a jar file for the annotations
 * a jar file for the annotations processor

The full build may take an hour or more, to complete.

### Building from source

It is possible to build Realm Java with the submodule version of Realm Core. This is done by providing the following parameter when building: `-PbuildCore=true`.

```
./gradlew assembleBase -PbuildCore=true
```

You can turn off interprocedural optimizations with the following parameter: `-PenableLTO=false`. 

```
./gradlew assembleBase -PenableLTO=false`
```

Note: Building the `Base` variant would always build realm-core.

Note: Interprocedural optimizations are enabled by default.

Note: If you want to build from source inside Android Studio, you need to update the Gradle parameters by going into the Realm projects settings `Settings > Build, Execution, Deployment > Compiler > Command-line options` and add `-PbuildCore=true` or `-PenableLTO=false` to it. Alternatively you can add it into your `gradle.properties`:

```
buildCore=true
enableLTO=false
```

Note: If building on OSX you might like to prevent Gatekeeper to block all NDK executables by disabling it: `sudo spctl --master-disable`. Remember to enable it afterwards: `sudo spctl --master-enable`

### Other Commands

 * `./gradlew tasks` will show all the available tasks
 * `./gradlew javadoc` will generate the Javadocs
 * `./gradlew monkeyExamples` will run the monkey tests on all the examples
 * `./gradlew installRealmJava` will install the Realm library and plugin to mavenLocal()
 * `./gradlew clean -PdontCleanJniFiles` will remove all generated files except for JNI related files. This reduces recompilation time a lot.
 * `./gradlew connectedUnitTests -PbuildTargetABIs=$(adb shell getprop ro.product.cpu.abi)` will build JNI files only for the ABI which corresponds to the connected device.  These tests require a running Object Server (see below)

Generating the Javadoc using the command above may generate warnings. The Javadoc is generated despite the warnings.


### Upgrading Gradle Wrappers

 All gradle projects in this repository have `wrapper` task to generate Gradle Wrappers. Those tasks refer to `gradle` property defined in `/dependencies.list` to determine Gradle Version of generating wrappers.
We have a script `./tools/update_gradle_wrapper.sh` to automate these steps. When you update Gradle Wrappers, please obey the following steps.

 1. Edit `gradle` property in defined in `/dependencies.list` to new Gradle Wrapper version.
 2. Execute `/tools/update_gradle_wrapper.sh`.

### Gotchas

The repository is organized into six Gradle projects:

 * `realm`: it contains the actual library (including the JNI layer) and the annotations processor.
 * `realm-annotations`: it contains the annotations defined by Realm.
 * `realm-transformer`: it contains the bytecode transformer.
 * `gradle-plugin`: it contains the Gradle plugin.
 * `examples`: it contains the example projects. This project directly depends on `gradle-plugin` which adds a dependency to the artifacts produced by `realm`.
 * The root folder is another Gradle project.  All it does is orchestrate the other jobs.

This means that `./gradlew clean` and `./gradlew cleanExamples` will fail if `assembleExamples` has not been executed first.
Note that IntelliJ [does not support multiple projects in the same window](https://youtrack.jetbrains.com/issue/IDEABKL-6118#)
so each of the six Gradle projects must be imported as a separate IntelliJ project.

Since the repository contains several completely independent Gradle projects, several independent builds are run to assemble it.
Seeing a line like: `:realm:realm-library:compileBaseDebugAndroidTestSources UP-TO-DATE` in the build log does *not* imply
that you can run `./gradlew :realm:realm-library:compileBaseDebugAndroidTestSources`.

## Examples

The `./examples` folder contains many example projects showing how Realm can be used. If this is the first time you checkout or pull a new version of this repository to try the examples, you must call `./gradlew installRealmJava` from the top-level directory first. Otherwise, the examples will not compile as they depend on all Realm artifacts being installed in `mavenLocal()`.

## Running Tests on a Device

To run these tests, you must have a device connected to the build computer, and the `adb` command must be in your `PATH`

1. Connect an Android device and verify that the command `adb devices` shows a connected device:

    ```sh
    adb devices
    List of devices attached
    004c03eb5615429f device
    ```

2. Run instrumentation tests:

    ```sh
    cd realm
    ./gradlew connectedBaseDebugAndroidTest
    ```

These tests may take as much as half an hour to complete.

## Running Tests Using The Realm Object Server

Tests in `realm/realm-library/src/syncIntegrationTest` require a running testing server to work.
A docker image can be built from `tools/sync_test_server/Dockerfile` to run the test server.
`tools/sync_test_server/start_server.sh` will build the docker image automatically.

To run a testing server locally:

1. Install [docker](https://www.docker.com/products/overview) and run it.

2. Run `tools/sync_test_server/start_server.sh`:

    ```sh
    cd tools/sync_test_server
    ./start_server.sh
    ```

    This command will not complete until the server has stopped.

3. Run instrumentation tests

    In a new terminal window, run:

    ```sh
    cd realm
    ./gradlew connectedObjectServerDebugAndroidTest
    ```

Note that if using VirtualBox (Genymotion), the network needs to be bridged for the tests to work.
This is done in `VirtualBox > Network`. Set "Adapter 2" to "Bridged Adapter".

These tests may take as much as half an hour to complete.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [MongoDB Code of Conduct](https://www.mongodb.com/community-code-of-conduct).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [community-conduct@mongodb.com](mailto:community-conduct@mongodb.com).

The directory `realm/config/studio` contains lint and style files recommended for project code.
Import them from Android Studio with Android Studio > Preferences... > Code Style > Manage... > Import,
or Android Studio > Preferences... > Inspections > Manage... > Import.  Once imported select the
style/lint in the drop-down to the left of the Manage... button.

## License

Realm Java Local is published under the Apache 2.0 license.

## Contributing

This is a community-maintained project focused on local database functionality. Contributions welcome for:

- Bug fixes and performance improvements
- Local database feature enhancements
- Documentation improvements

**Note**: We do not accept sync-related contributions as this project is specifically local-only.

## Acknowledgments

Based on the original Realm Java by MongoDB. Thanks to the Realm team for creating an excellent local database foundation.
