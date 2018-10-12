#!/bin/bash

for len in $(seq 10 100); do
    original="$(seq $len)"
    shuffled="$(echo "$original" | ./shuffle.pl)"
    resorted="$(echo "$shuffled" | sort -n)"
    if [ "$original" != "$resorted" ]; then
        echo -e "\033[1;31mThe elements are not the same!\033[0m"

        echo "Original:"
        echo "$(echo "$original" | sed 's/^/    /')"
        echo "Shuffled:"
        echo "$(echo "$shuffled" | sed 's/^/    /')"
        exit 1
    elif [ "$original" == "$shuffled" ]; then
        echo -e "\033[1;33mThe shuffled list is the same as the original list.\033[0m"
    fi
done
