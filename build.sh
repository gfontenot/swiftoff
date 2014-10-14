#!/usr/bin/env bash
xcodebuild -project Liftoff.xcodeproj \
  -scheme liftoff \
  -derivedDataPath build \
  LD_RUNPATH_SEARCH_PATHS="__LIB__"

cp -r build/Build/Products/Debug/*.framework frameworks
