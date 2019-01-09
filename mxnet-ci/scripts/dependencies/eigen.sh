#!/usr/bin/env bash
set -eo pipefail

EIGEN_VERSION=3.3.4

if [[ ! -d $DEPS_PATH/include/eigen3 ]]; then
    # download eigen
    >&2 echo "Loading eigen..."
    curl -s -L https://github.com/eigenteam/eigen-git-mirror/archive/$EIGEN_VERSION.zip -o $DEPS_PATH/eigen.zip
    unzip -q $DEPS_PATH/eigen.zip -d $DEPS_PATH
    mkdir -p $DEPS_PATH/eigen-git-mirror-$EIGEN_VERSION/build
    cd $DEPS_PATH/eigen-git-mirror-$EIGEN_VERSION/build
    $CMAKE \
          -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=$DEPS_PATH ..
    $MAKE install
    cd -
fi
