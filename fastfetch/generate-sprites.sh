#!/bin/bash

# Ensure the output directory exists
output_dir="sprites"
mkdir -p "$output_dir"

# Iterate over each line in the file
while IFS= read -r pokemon; do
    # Clean up the name (split by '--' and take the first part, remove spaces/special characters)
    clean_name=$(echo "$pokemon" | awk -F '--' '{print $1}' | tr -d '\r' | tr ' ' '_' | sed 's/[^a-zA-Z0-9_-]//g')

    # Skip empty or invalid names
    if [ -n "$clean_name" ]; then
        # Generate the sprite and check if it's valid
        sprite=$(pokeget "$pokemon" --hide-name 2>&1)
        if [[ "$sprite" != "pokemon not found" ]]; then
            echo "$sprite" >"$output_dir/$clean_name.sprite"
            echo "Generated sprite for $pokemon as $output_dir/$clean_name.sprite"
        else
            echo "Skipping $pokemon: Not found"
        fi
    fi
done <"pokemon-names.txt"
