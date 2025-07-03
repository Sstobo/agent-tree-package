#!/usr/bin/env python3
"""
PDF Text Extraction Script
Uses PyMuPDF (fitz) to extract text from PDF files
"""

import sys
import os
from pathlib import Path

def extract_pdf(path):
    """Extract text from a PDF file using PyMuPDF"""
    try:
        import fitz  # PyMuPDF
    except ImportError:
        print("Error: PyMuPDF is not installed. Install with: pip install pymupdf", file=sys.stderr)
        return None
    
    try:
        # Open the PDF document
        doc = fitz.open(path)
        
        # Extract text from all pages
        text_content = []
        for page_num in range(len(doc)):
            page = doc[page_num]
            text_content.append(page.get_text())
        
        # Close the document
        doc.close()
        
        return "\n".join(text_content)
    
    except Exception as e:
        print(f"Error processing {path}: {str(e)}", file=sys.stderr)
        return None

def main():
    """Main function to handle command line arguments"""
    if len(sys.argv) < 2:
        print("Usage: python3 extract-pdf.py <pdf_file1> [pdf_file2] ...", file=sys.stderr)
        sys.exit(1)
    
    for file_path in sys.argv[1:]:
        # Check if file exists
        if not os.path.exists(file_path):
            print(f"Error: File '{file_path}' not found", file=sys.stderr)
            continue
        
        # Check if it's a PDF file
        if not file_path.lower().endswith('.pdf'):
            print(f"Warning: '{file_path}' does not appear to be a PDF file", file=sys.stderr)
            continue
        
        # Extract text
        text = extract_pdf(file_path)
        
        if text is not None:
            print(f"=== Content from {file_path} ===")
            print(text)
            print(f"=== End of {file_path} ===\n")
        else:
            print(f"Failed to extract text from {file_path}", file=sys.stderr)

if __name__ == "__main__":
    main()