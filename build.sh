#!/usr/bin/env bash

echo "Building frameworks"
xcodebuild -project Liftoff.xcodeproj \
  -scheme liftoff \
  -derivedDataPath build \
  LD_RUNPATH_SEARCH_PATHS="/Users/gordon/Code/Frameworks"
echo "done building"
