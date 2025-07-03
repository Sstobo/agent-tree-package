# Document-Reader Agent

## Overview
Document-Reader is a specialized agent that extracts text content from PDF and DOCX files using Python libraries. It provides clean, readable text extraction with minimal overhead and proper error handling.

## Features
- **PDF Text Extraction**: Uses PyMuPDF (fitz) for reliable PDF text extraction
- **DOCX Text Extraction**: Uses python-docx for Word document processing
- **Clean Output**: Maintains readable formatting while removing unnecessary artifacts
- **Error Handling**: Graceful handling of unsupported file formats
- **Minimal Dependencies**: Only uses the two required Python libraries

## Installation
```bash
npx agent-tree add document-reader
```

## Usage
Type `/document-reader` in Claude Code to activate this agent.

## Commands
- `*help` - Show available commands
- `*extract-pdf` - Extract text from PDF files
- `*extract-docx` - Extract text from DOCX files
- `*process-document` - Execute complete document processing workflow
- `*report-in` - Report current status
- `*exit` - Exit document-reader mode

## Dependencies
The agent requires these Python libraries:
- `pymupdf` - For PDF text extraction
- `python-docx` - For DOCX text extraction

Install with:
```bash
pip install pymupdf python-docx
```

## Workflows
- **process-document**: End-to-end document processing workflow

## Files Structure
```
agent-tree/document-reader/
├── scripts/
│   ├── current-date.sh
│   ├── extract-pdf.py
│   └── extract-docx.py
├── tasks/
│   ├── extract-document.md
│   └── report-in.md
└── workflows/
    └── process-document.md
```

## Supported Formats
- **PDF**: All standard PDF files with extractable text
- **DOCX**: Microsoft Word documents (.docx format)

## Usage Examples
```bash
# Extract text from a PDF
python3 agent-tree/document-reader/scripts/extract-pdf.py document.pdf

# Extract text from a DOCX file
python3 agent-tree/document-reader/scripts/extract-docx.py document.docx
```

## Best Practices
1. Ensure Python 3 is installed with required libraries
2. Provide full file paths for reliable extraction
3. Check file permissions before processing
4. Handle large documents with appropriate memory considerations