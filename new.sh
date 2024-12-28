#!/usr/bin/env bash

# The first argument is the title passed from the Makefile
TITLE="$1"

# Use today's date in YYYY-MM-DD format
DATE=$(date +"%Y-%m-%d")

# Slugify the title to create the file name
# This lowercases the title, replaces spaces with dashes, etc.
SLUG=$(echo "$TITLE" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[^a-z0-9]+/-/g; s/^-|-$//g')

# Construct the output filename
FILE="content/posts/${DATE}-${SLUG}.md"

# Write the front-matter into the file
cat << EOF > "$FILE"
---
title: "$TITLE"
date: $DATE
categories: []
---
EOF

echo "Created $FILE"
