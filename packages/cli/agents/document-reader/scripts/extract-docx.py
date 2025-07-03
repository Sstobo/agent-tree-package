#!/usr/bin/env python3
"""
DOCX Text Extraction Script
Uses python-docx to extract text from Word documents
"""

import sys
import os
from pathlib import Path

def extract_docx(path):
    """Extract text from a DOCX file using python-docx"""
    try:
        from docx import Document
    except ImportError:
        print("Error: python-docx is not installed. Install with: pip install python-docx", file=sys.stderr)
        return None
    
    try:
        # Open the DOCX document
        doc = Document(path)
        
        # Extract text from all paragraphs
        text_content = []
        for paragraph in doc.paragraphs:
            text_content.append(paragraph.text)
        
        return "\n".join(text_content)
    
    except Exception as e:
        print(f"Error processing {path}: {str(e)}", file=sys.stderr)
        return None

def main():
    """Main function to handle command line arguments"""
    if len(sys.argv) < 2:
        print("Usage: python3 extract-docx.py <docx_file1> [docx_file2] ...", file=sys.stderr)
        sys.exit(1)
    
    for file_path in sys.argv[1:]:
        # Check if file exists
        if not os.path.exists(file_path):
            print(f"Error: File '{file_path}' not found", file=sys.stderr)
            continue
        
        # Check if it's a DOCX file
        if not file_path.lower().endswith('.docx'):
            print(f"Warning: '{file_path}' does not appear to be a DOCX file", file=sys.stderr)
            continue
        
        # Extract text
        text = extract_docx(file_path)
        
        if text is not None:
            print(f"=== Content from {file_path} ===")
            print(text)
            print(f"=== End of {file_path} ===\n")
        else:
            print(f"Failed to extract text from {file_path}", file=sys.stderr)

if __name__ == "__main__":
    main()