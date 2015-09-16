#!/bin/bash

PATH="/bin:/usr/bin"

# Custom facter fact purely in bash
# (this will not work in `sh`)

# Output will look like:
# {
#    "FOO": "SOME_VALUE",
#    "BAR": "SOME_VALUE",
#    "BAZ": "SOME_VALUE"
# }

ARR=()

for i in FOO BAR BAZ ; do
    ARR+=("\"${i}\": \"SOME_VALUE\"")
done

echo "{"

i=0
MAX=$((${#ARR[@]} - 1))

while [ $i -lt $MAX ] ; do
  echo "    ${ARR[$i]},"
  i=$((i+1))
done

echo "    ${ARR[$MAX]}"

echo "}"
