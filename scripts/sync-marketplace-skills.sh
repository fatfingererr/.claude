#!/bin/bash
# Sync skills from non-claude marketplace plugins to current directory

# Change to .claude directory
cd .claude

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
        echo "Copying skills from: $plugin_name -> $TARGET_BASE_DIR"
        cp -r "$skills_dir"/* "$TARGET_BASE_DIR"/ 2>/dev/null || true
    fi
done

echo "Done!"

# Change back to original directory
cd ..
