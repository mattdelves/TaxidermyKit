#!/bin/bash

# Exits bash immediately if any command fails
set -e

echo "--- TaxidermyKit Tests"

# Will output commands as the run
set -x

# If the git repo doesn't exist in the b
if [ ! -d ".git" ]; then
    git clone "$BUILDBOX_REPO" . -q
fi

# Always start with a clean repo
git clean -fd

# Remove DerivedData
rm -Rf ./DerivedData

# Fetch the latest commits from origin, and checkout to the commit being tested
git fetch -q
git checkout -qf "$BUILDBOX_COMMIT"

git submodule init
git submodule update

set -o pipefail && xcrun xcodebuild -workspace TaxidermyKit.xcworkspace -scheme TaxidermyKit  -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.2' clean build test | tee -a logs/unit_test.log | xcpretty -c
