#!/bin/bash
set -eux

for path in messages/*.erb
do
    template=${path#messages/}
    diff -u "../../../app/messages/$template" "messages/$template" > "message_diffs/$template.diff" || true
done
