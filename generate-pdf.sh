#!/bin/bash

# PDF Generation Script for Demo Docs
# Usage: ./generate-pdf.sh [version]

set -e

# Get version from command line or use default
VERSION=${1:-"1.0"}
DATE=$(date +"%Y-%m-%d")
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "🚀 Generating PDF for Demo Docs..."
echo "Version: $VERSION"
echo "Date: $DATE"
echo "Timestamp: $TIMESTAMP"

# Create PDF output directory
mkdir -p pdf

# Generate PDF using mkdocs
echo "📄 Building PDF..."
mkdocs build

# Check if PDFs were generated
if [ -f "site/index.pdf" ]; then
    echo "✅ PDFs generated successfully!"
    
    # Create pdf directory if it doesn't exist
    mkdir -p pdf
    
    # Copy all PDFs to pdf directory
    cp site/*.pdf pdf/ 2>/dev/null || true
    cp site/*/*.pdf pdf/ 2>/dev/null || true
    cp site/*/*/*.pdf pdf/ 2>/dev/null || true
    
    # Create a combined PDF using pdftk or similar (if available)
    if command -v pdftk &> /dev/null; then
        echo "📄 Creating combined PDF..."
        # Get only non-versioned PDFs and combine them in navigation order
        pdftk pdf/index.pdf pdf/getting-started.pdf pdf/system-arch.pdf pdf/template.pdf pdf/pdf-workflow.pdf cat output "pdf/demo-docs-combined.pdf"
        echo "   - pdf/demo-docs-combined.pdf (combined)"
    else
        echo "📄 Individual PDFs created (install pdftk for combined PDF)"
    fi
    
    # Create versioned copies (only for non-versioned files)
    for pdf_file in pdf/*.pdf; do
        if [ -f "$pdf_file" ] && [[ ! "$pdf_file" =~ -v[0-9] ]]; then
            filename=$(basename "$pdf_file" .pdf)
            versioned_file="pdf/${filename}-v${VERSION}-${TIMESTAMP}.pdf"
            cp "$pdf_file" "$versioned_file"
        fi
    done
    
    echo "📋 PDF files created:"
    echo "   - Individual page PDFs in pdf/ directory"
    echo "   - Versioned copies with timestamp"
    
    # Display file sizes
    echo "📊 File sizes:"
    ls -lh pdf/*.pdf
    
    echo ""
    echo "🎉 PDF generation complete!"
    echo "📝 Ready for approval and baseline process"
    
else
    echo "❌ PDF generation failed!"
    exit 1
fi
