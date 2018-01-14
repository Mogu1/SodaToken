#!/bin/bash

set -e

REPOROOT="$(readlink -f "$(dirname "$0")"/../../)"

function test_rpath_runpath {
    if "${REPOROOT}/qa/sodatoken/checksec.sh" --file "$1" | grep -q "No RPATH.*No RUNPATH"; then
        echo PASS: "$1" has no RPATH or RUNPATH.
        return 0
    else
        echo FAIL: "$1" has an RPATH or a RUNPATH.
        "${REPOROOT}/qa/sodatoken/checksec.sh" --file "$1"
        return 1
    fi
}

function test_fortify_source {
    if { "${REPOROOT}/qa/sodatoken/checksec.sh" --fortify-file "$1" | grep -q "FORTIFY_SOURCE support available.*Yes"; } &&
       { "${REPOROOT}/qa/sodatoken/checksec.sh" --fortify-file "$1" | grep -q "Binary compiled with FORTIFY_SOURCE support.*Yes"; }; then
        echo PASS: "$1" has FORTIFY_SOURCE.
        return 0
    else
        echo FAIL: "$1" is missing FORTIFY_SOURCE.
        return 1
    fi
}

# PIE, RELRO, Canary, and NX are tested by make check-security.
make -C "$REPOROOT/src" check-security

test_rpath_runpath "${REPOROOT}/src/sodatokend"
test_rpath_runpath "${REPOROOT}/src/sodatoken-cli"
test_rpath_runpath "${REPOROOT}/src/sodatoken-gtest"
test_rpath_runpath "${REPOROOT}/src/sodatoken-tx"
test_rpath_runpath "${REPOROOT}/src/test/test_bitcoin"
test_rpath_runpath "${REPOROOT}/src/zcash/GenerateParams"

# NOTE: checksec.sh does not reliably determine whether FORTIFY_SOURCE is
# enabled for the entire binary. See issue #915.
test_fortify_source "${REPOROOT}/src/sodatokend"
test_fortify_source "${REPOROOT}/src/sodatoken-cli"
test_fortify_source "${REPOROOT}/src/sodatoken-gtest"
test_fortify_source "${REPOROOT}/src/sodatoken-tx"
test_fortify_source "${REPOROOT}/src/test/test_bitcoin"
test_fortify_source "${REPOROOT}/src/zcash/GenerateParams"
