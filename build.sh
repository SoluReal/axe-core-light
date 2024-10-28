#!/bin/bash

set -e

AXE_VERSION=4.10.2

# Cleanup old checkout if any
rm -rf axe-core

git clone --depth 1 --branch v${AXE_VERSION} https://github.com/dequelabs/axe-core axe-core

pushd axe-core
npm ci

npm run build

original=$(ls -lh axe.min.js | awk '{print $5}')

echo "Applying patch files"
for PATCH in "../patches"/*; do
    if [ -f "$PATCH" ]; then
        echo "Applying patch $PATCH"
        git apply $PATCH
    fi
done

npx update-browserslist-db

npm run build

light_file_size=$(ls -lh axe.min.js | awk '{print $5}')

npm run test

popd

echo "Original fileSize: $original"
echo "Light fileSize: $light_file_size"
echo "Note: run terser to remove dead code, caused by the patches"
