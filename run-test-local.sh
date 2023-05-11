#!/bin/bash
set -euo pipefail


# Setup for local testing
# 
# export TANZU_CLI=tanzu
# export CLI_PLUGIN=acc
# export TEST_PATTERN=tanzu-java-web-app-*
# export TEST_WORKSPACE=$PWD
# export ACC_SERVER_URL=<URL>

PATTERN="${TEST_PATTERN:-*}"

pushd .github/tests
for test_name in ${PATTERN}; do
#for test_name in tanzu-java-*-boot3; do
#for test_name in tanzu-java-*-boot3_gradle; do
  echo "** TESTING $test_name **"
  ./generate.sh $test_name
  ./run-test.sh $test_name
done
popd