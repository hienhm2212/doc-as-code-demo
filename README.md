# Docs-as-Code Demo

A demonstration of a docs-as-code workflow using MkDocs, Material theme, and Org-mode.

## Features

- **MkDocs** with Material theme for beautiful documentation
- **Org-mode** support for content authoring
- **PDF generation** for approval and baseline processes
- **GitHub Pages** deployment
- **Custom Catppuccin theme** styling
- **Syntax highlighting** for code blocks
- **Responsive design** with dark/light mode toggle

## Quick Start

### Prerequisites

- Python 3.7+
- pip package manager
- Git for version control

### Installation

```bash
# Clone the repository
git clone https://github.com/hienhm2212/docs-as-code-demo.git
cd docs-as-code-demo

# Install dependencies
pip install mkdocs-material
pip install mkdocs-pdf-export-plugin
```

### Local Development

```bash
# Start local development server
mkdocs serve

# Build the site
mkdocs build

# Clean build (removes PDF files)
./clean-and-build.sh
```

### PDF Generation

```bash
# Generate PDFs for approval process
./generate-pdf.sh

# Generate PDFs with specific version
./generate-pdf.sh 1.0
```

## Project Structure

```
docs-as-code-demo/
├── docs/
│   ├── index.md          # Main documentation
│   ├── getting-started.md # Getting started guide
│   ├── pdf-workflow.md   # PDF generation workflow
│   ├── design/
│   │   └── system-arch.md # System architecture
│   ├── template.md       # Template documentation
│   └── stylesheets/      # Custom CSS
│       ├── catppuccin.css # Catppuccin theme
│       └── pdf.css       # PDF-specific styles
├── mkdocs.yml           # MkDocs configuration
├── generate-pdf.sh      # PDF generation script
├── clean-and-build.sh   # Clean build script
└── site/                # Generated site (after build)
```

## Deployment

### GitHub Pages

The site is automatically deployed to GitHub Pages via GitHub Actions:

1. **Push to main branch** triggers automatic deployment
2. **PDF files are excluded** from the deployment
3. **Site is built** and deployed to GitHub Pages

### Manual Deployment

```bash
# Clean build and deploy
./clean-and-build.sh
mkdocs gh-deploy --force
```

## PDF Workflow

### For Approval Processes

1. **Generate PDFs**: `./generate-pdf.sh 1.0`
2. **Review content** in generated PDFs
3. **Share for approval** with stakeholders
4. **Version control** with timestamps

### Output Files

- `pdf/demo-docs-combined.pdf` - All pages combined
- `pdf/index.pdf` - Individual page PDFs
- `pdf/*-v{VERSION}-{TIMESTAMP}.pdf` - Versioned copies

## Customization

### Theme

The site uses a custom Catppuccin theme with:
- Dark/light mode toggle
- Custom navigation styling
- Responsive design
- Syntax highlighting

### PDF Styling

PDF-specific CSS ensures:
- Proper content visibility
- Code block formatting
- Table styling
- Page layout optimization

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `mkdocs serve`
5. Submit a pull request

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Support

For questions or issues:
- Check the documentation
- Search existing issues
- Create a new issue
- Contact the maintainers
