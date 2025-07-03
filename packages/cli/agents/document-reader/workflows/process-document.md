# Process Document

## process-document command

## Process Document Workflow Instructions:

This workflow provides end-to-end document processing from file input to text extraction output.

### Step 1: Initial Setup
1. Verify Python environment and dependencies
2. Check that PyMuPDF and python-docx are installed
3. Update ACTIVE_CONTEXT with workflow start

### Step 2: Document Discovery
1. Ask user to provide document file path(s)
2. Validate file existence and accessibility
3. Identify document type(s) based on file extension
4. Create processing queue for multiple documents

### Step 3: Pre-processing Validation
1. Check file permissions and readability
2. Verify file format compatibility (.pdf, .docx)
3. Estimate processing time for large files
4. Confirm user wants to proceed

### Step 4: Text Extraction
1. Process each document using appropriate extraction method:
   - PDF files: Execute `extract-pdf.py` script
   - DOCX files: Execute `extract-docx.py` script
2. Handle errors gracefully and continue with remaining files
3. Collect all extracted text content

### Step 5: Post-processing
1. Format extracted text for readability
2. Remove excessive whitespace and formatting artifacts
3. Provide content summary (word count, character count)
4. Save extracted text to output file if requested

### Step 6: Results and Cleanup
1. Display extraction results to user
2. Report any errors or warnings encountered
3. Update ACTIVE_CONTEXT with completion status
4. Clean up temporary files if any were created

## Expected Workflow Output:
```
Document Processing Complete:
- Files processed: X
- Successful extractions: Y
- Errors encountered: Z
- Total text extracted: N characters
```

## Error Recovery:
- Continue processing remaining files if one fails
- Provide detailed error messages for debugging
- Suggest solutions for common issues
- Log all activities for troubleshooting