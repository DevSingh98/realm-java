#!/bin/bash

# Realm Java Local Build Script
set -e

echo "Building Realm Java Local..."
echo "This builds the local-only version without sync functionality."
echo ""

# Clean and build
echo "Cleaning and building..."
./gradlew clean
./gradlew assembleRealm
./gradlew installRealmJava

echo ""
echo "✅ Build completed!"
echo ""
echo "Use in your project:"
echo "implementation 'io.realm.local:realm-android-library-local:11.0.0-local'"
echo "kapt 'io.realm:realm-annotations-processor:11.0.0-local'"