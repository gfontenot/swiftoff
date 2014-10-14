#!/usr/bin/env bash
xcodebuild -project Liftoff.xcodeproj \
  -scheme liftoff \
  -derivedDataPath build \
  LD_RUNPATH_SEARCH_PATHS="__LIB__"

# mv build/Build/Products/Debug/*.framework frameworks
