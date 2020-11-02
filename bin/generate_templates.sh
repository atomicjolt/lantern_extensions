#!/bin/bash
set -eux

for path in message_diffs/*.diff
do
    diff="${path#message_diffs/}"
    cp "../../../app/messages/${diff%.diff}" ./messages
    patch -p0 < "$path"
done
