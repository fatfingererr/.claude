#!/bin/bash
# Remove all skill directories that don't start with "create"

# Change to .claude directory
cd .claude

SKILLS_DIR="./skills"

if [[ ! -d "$SKILLS_DIR" ]]; then
    echo "Skills directory not found: $SKILLS_DIR"
    cd ..
    exit 1
fi

echo "Cleaning non-create skills from: $SKILLS_DIR"

# Loop through all directories in skills/
for skill_dir in "$SKILLS_DIR"/*/; do
    if [[ -d "$skill_dir" ]]; then
        skill_name=$(basename "$skill_dir")

        # Check if the directory name starts with "create"
        if [[ "$skill_name" != create* ]]; then
            echo "Removing: $skill_name"
            rm -rf "$skill_dir"
        else
            echo "Keeping: $skill_name"
        fi
    fi
done

echo "Done!"

# Change back to original directory
cd ..
