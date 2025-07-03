# Extract Document

## extract-document command

## Task Instructions:

1. DETERMINE the document type by examining the file extension:
   - .pdf files → Use the PDF extraction script
   - .docx files → Use the DOCX extraction script
   - Other files → Inform user of unsupported format

2. VALIDATE the file exists and is accessible:
   - Check if file path is valid
   - Verify file permissions
   - Confirm file is not corrupted

3. EXECUTE the appropriate extraction script:
   - For PDF: `python3 agent-tree/document-reader/scripts/extract-pdf.py <file_path>`
   - For DOCX: `python3 agent-tree/document-reader/scripts/extract-docx.py <file_path>`

4. PROCESS the output:
   - Display the extracted text to the user
   - Handle any error messages appropriately
   - Provide feedback on extraction success or failure

5. UPDATE the ACTIVE_CONTEXT if required:
   - Log the extraction activity
   - Note any issues encountered
   - Record successful extractions for future reference

## Expected Output Format:
```
=== Content from <filename> ===
<extracted text content>
=== End of <filename> ===
```

## Error Handling:
- Missing dependencies: Guide user to install required Python packages
- File not found: Provide clear error message with file path
- Unsupported format: List supported formats (.pdf, .docx)
- Extraction failure: Report specific error and suggest troubleshooting steps