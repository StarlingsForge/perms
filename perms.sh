#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a filename as an argument."
    exit 1
fi

permissions=$(ls -l "$1" | awk '{print $1}')

owner_perm=$(echo "$permissions" | cut -c2-4)
group_perm=$(echo "$permissions" | cut -c5-7)
other_perm=$(echo "$permissions" | cut -c8-10)

perm_to_text() {
    case $1 in
        r) echo "Read" ;;
        w) echo "Write" ;;
        x) echo "Execute" ;;
        -) echo "No permission" ;;
    esac
}

echo "Permissions for file: $1"
echo "User permissions: $(perm_to_text ${owner_perm:0:1}), $(perm_to_text ${owner_perm:1:1}), $(perm_to_text ${owner_perm:2:1})"
echo "Group permissions: $(perm_to_text ${group_perm:0:1}), $(perm_to_text ${group_perm:1:1}), $(perm_to_text ${group_perm:2:1})"
echo "Other permissions: $(perm_to_text ${other_perm:0:1}), $(perm_to_text ${other_perm:1:1}), $(perm_to_text ${other_perm:2:1})"

