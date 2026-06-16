#!/bin/bash

# Configuration
BASE_URL="https://erik-schuetze.dev"
SITE_DIR="site"
OUTPUT_FILE="${SITE_DIR}/sitemap.xml"

# Start XML
cat <<XML > "$OUTPUT_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
XML

# Find all HTML files, sort them for consistent output
find "$SITE_DIR" -name "*.html" | sort | while read -r file; do
    # Remove the $SITE_DIR/ prefix
    path="${file#$SITE_DIR/}"
    
    # Handle index.html mappings
    if [[ "$path" == "index.html" ]]; then
        url="$BASE_URL/"
    elif [[ "$path" == *"index.html" ]]; then
        # Replace index.html with nothing, but keep the trailing slash
        url="$BASE_URL/${path%index.html}"
    else
        # For non-index.html files
        url="$BASE_URL/$path"
    fi

    # Output URL element
    cat <<XML >> "$OUTPUT_FILE"
  <url>
    <loc>${url}</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
XML
done

# End XML
cat <<XML >> "$OUTPUT_FILE"
</urlset>
XML

echo "Sitemap generated at $OUTPUT_FILE"
