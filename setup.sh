#!/usr/bin/env bash -xe

mkdir -p ~/workspace
git clone git@github.com:ignitionworks/setup-osx.git ~/workspace/setup-osx

pushd ~/workspace/setup-osx
  rake
popd
