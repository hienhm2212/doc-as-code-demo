# PDF Generation Workflow

This document describes the PDF generation process for approval and baseline workflows.

## Overview

The PDF generation system creates professional PDF documents from your MkDocs documentation for:
- **Approval processes** - Stakeholder review and sign-off
- **Baseline documentation** - Version-controlled snapshots
- **Compliance requirements** - Audit trails and documentation

## Prerequisites

### Install PDF Dependencies

```bash
# Install PDF generation requirements
pip install -r requirements-pdf.txt

# Or install individually
pip install mkdocs-pdf-export-plugin weasyprint
```

### System Requirements

- **Linux**: May need additional system packages
- **macOS**: Should work out of the box
- **Windows**: May require additional setup

## PDF Generation Process

### 1. Quick PDF Generation

```bash
# Generate PDF with default version (1.0)
./generate-pdf.sh

# Generate PDF with specific version
./generate-pdf.sh 2.1
```

### 2. Manual PDF Generation

```bash
# Build the site and generate PDF
mkdocs build

# PDF will be created in pdf/demo-docs.pdf
```

### 3. Versioned PDF Generation

The script automatically creates:
- Individual page PDFs (e.g., `index.pdf`, `getting-started.pdf`)
- Combined PDF (`demo-docs-combined.pdf`) - All pages merged
- Versioned copies with timestamps for audit trails

## PDF Features

### Individual Page PDFs
- **Per-page generation**: Each documentation page becomes a separate PDF
- **Maintains formatting**: Preserves all styling and layout
- **Easy distribution**: Share specific sections as needed

### Combined PDF
- **Single document**: All pages merged into one comprehensive PDF
- **Automatic ordering**: Follows the navigation structure
- **Professional output**: Ready for approval and baseline processes

### Version Control
- **Timestamped versions**: Automatic versioning with timestamps
- **Audit trail**: Complete history of document versions
- **Semantic versioning**: Support for custom version numbers

## Approval Workflow

### 1. Generate PDF for Review
```bash
./generate-pdf.sh 1.0
```

### 2. Review Process
- **Stakeholder review** of PDF content
- **Technical review** of accuracy
- **Compliance review** of requirements

### 3. Approval Sign-off
- **Digital signatures** (if required)
- **Version control** of approved PDFs
- **Audit trail** maintenance

## Baseline Process

### 1. Create Baseline PDF
```bash
# Generate baseline version
./generate-pdf.sh 1.0-baseline
```

### 2. Version Control
- **Git tagging** of baseline versions
- **Release notes** documentation
- **Change tracking** between versions

### 3. Distribution
- **Internal distribution** to teams
- **External distribution** to stakeholders
- **Archive storage** for compliance

## Configuration

### PDF Settings (mkdocs.yml)

```yaml
plugins:
  - search
  - pdf-export
```

The `mkdocs-pdf-export-plugin` automatically generates individual PDFs for each page in your documentation.

### Customization Options

- **PDF-specific CSS** - Optimized styles for PDF generation
- **Code block preservation** - Maintains syntax highlighting and formatting
- **Table formatting** - Ensures proper table display and borders
- **Content visibility** - Ensures all content is properly displayed
- **Page layout** - A4 format with proper margins
- **Typography** - Optimized fonts for PDF readability

## Best Practices

### 1. Version Management
- **Semantic versioning** (1.0, 1.1, 2.0)
- **Timestamped backups** for audit trails
- **Clear naming conventions**

### 2. Quality Assurance
- **Pre-generation review** of content
- **PDF validation** after generation
- **Cross-platform testing**

### 3. Documentation
- **Change logs** for each version
- **Approval records** maintenance
- **Distribution lists** tracking

## Troubleshooting

### Common Issues

1. **PDF not generated**
   - Check plugin installation
   - Verify mkdocs.yml configuration
   - Review error logs

2. **Styling issues**
   - CSS compatibility with PDF
   - Font availability
   - Layout adjustments

3. **Performance**
   - Large document optimization
   - Image compression
   - Memory usage monitoring

### Support

For issues with PDF generation:
1. Check the [mkdocs-pdf-export-plugin documentation](https://github.com/orzih/mkdocs-pdf-export-plugin)
2. Review system requirements
3. Verify all dependencies are installed

## Integration with CI/CD

### GitHub Actions Example

```yaml
name: Generate PDF
on:
  push:
    tags:
      - 'v*'

jobs:
  pdf:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      - name: Install dependencies
        run: |
          pip install -r requirements-pdf.txt
      - name: Generate PDF
        run: ./generate-pdf.sh ${{ github.ref_name }}
      - name: Upload PDF
        uses: actions/upload-artifact@v2
        with:
          name: documentation-pdf
          path: pdf/
```

This workflow ensures automated PDF generation for every release tag.
