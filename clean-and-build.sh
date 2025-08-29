#!/bin/bash

# Clean and Build Script for MkDocs
# This script ensures PDF files are removed from the site directory
# and the site is properly built for GitHub Pages deployment

set -e

echo "🧹 Cleaning up previous builds..."
rm -rf site/

echo "📄 Removing any PDF files from docs directory..."
find docs -name "*.pdf" -delete 2>/dev/null || true

echo "🏗️ Building MkDocs site..."
mkdocs build

echo "🗑️ Removing PDF files from site directory..."
find site -name "*.pdf" -delete 2>/dev/null || true

echo "✅ Site built successfully!"
echo "📁 Site directory contents:"
ls -la site/

echo ""
echo "🚀 Ready for deployment!"
echo "   Run: mkdocs gh-deploy --force"
echo "   Or push to trigger GitHub Actions"
