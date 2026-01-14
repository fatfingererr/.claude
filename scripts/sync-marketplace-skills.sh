#!/bin/bash
# Sync skills from non-claude marketplace plugins to current directory

MARKETPLACES_DIR="$HOME/.claude/plugins/marketplaces"
TARGET_BASE_DIR="./skills"

# Ensure base directory exists
mkdir -p "$TARGET_BASE_DIR"

# Find all non-claude prefixed directories
for plugin_dir in "$MARKETPLACES_DIR"/*/; do
    plugin_name=$(basename "$plugin_dir")

    # Skip directories starting with "claude"
    if [[ "$plugin_name" == claude* ]]; then
        echo "Skipping: $plugin_name (claude prefix)"
        continue
    fi

    skills_dir="$plugin_dir/skills"

    if [[ -d "$skills_dir" ]]; then
        target_dir="$TARGET_BASE_DIR/$plugin_name"
        echo "Copying skills from: $plugin_name -> $target_dir"
        mkdir -p "$target_dir"
        cp -r "$skills_dir"/* "$target_dir"/ 2>/dev/null || true
    fi
done

echo "Done!"
