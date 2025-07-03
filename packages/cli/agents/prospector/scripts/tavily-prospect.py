#!/usr/bin/env python3
"""
Tavily Business Prospecting Script

This script finds and extracts information about potential business clients
using the Tavily API for web search and content extraction.
"""

import os
import sys
import json
import argparse
from typing import List, Dict, Any, Optional
from tavily import TavilyClient


def get_api_key() -> str:
    """Get Tavily API key from environment variable."""
    api_key = os.environ.get('TAVILY_API_KEY')
    if not api_key:
        print("Error: TAVILY_API_KEY environment variable not set", file=sys.stderr)
        print("Please set your Tavily API key: export TAVILY_API_KEY='tvly-YOUR_API_KEY'", file=sys.stderr)
        sys.exit(1)
    return api_key


def search_businesses(
    industry: str,
    location: Optional[str] = None,
    company_size: Optional[str] = None,
    additional_terms: Optional[List[str]] = None,
    max_results: int = 10
) -> Dict[str, Any]:
    """
    Search for businesses in a specific industry and location.
    
    Args:
        industry: Industry or niche to search
        location: Geographic location (city, state, country)
        company_size: Company size (startup, SMB, enterprise)
        additional_terms: Additional search terms
        max_results: Maximum number of results
    
    Returns:
        Search results with potential leads
    """
    client = TavilyClient(api_key=get_api_key())
    
    # Build search query
    query_parts = [f'"{industry}" companies businesses']
    
    if location:
        query_parts.append(f'"{location}"')
    
    if company_size:
        query_parts.append(company_size)
    
    if additional_terms:
        query_parts.extend(additional_terms)
    
    query = " ".join(query_parts)
    
    try:
        response = client.search(
            query=query,
            search_depth="advanced",
            max_results=max_results,
            include_raw_content=True,
            include_answer=False
        )
        return response
    except Exception as e:
        print(f"Error searching businesses: {str(e)}", file=sys.stderr)
        sys.exit(1)


def extract_company_info(url: str) -> Dict[str, Any]:
    """
    Extract detailed information from a company website.
    
    Args:
        url: Company website URL
    
    Returns:
        Extracted company information
    """
    client = TavilyClient(api_key=get_api_key())
    
    try:
        response = client.extract(
            urls=url,
            include_images=False,
            extract_depth="advanced",
            format="markdown"
        )
        return response
    except Exception as e:
        print(f"Error extracting company info: {str(e)}", file=sys.stderr)
        return {"error": str(e)}


def find_contact_info(company_name: str, domain: Optional[str] = None) -> Dict[str, Any]:
    """
    Search for contact information for a specific company.
    
    Args:
        company_name: Name of the company
        domain: Company domain/website
    
    Returns:
        Contact information search results
    """
    client = TavilyClient(api_key=get_api_key())
    
    query = f'"{company_name}" contact email phone "contact us" "about us"'
    if domain:
        query += f' site:{domain}'
    
    try:
        response = client.search(
            query=query,
            search_depth="advanced",
            max_results=5,
            include_raw_content=True
        )
        return response
    except Exception as e:
        print(f"Error finding contact info: {str(e)}", file=sys.stderr)
        return {"error": str(e)}


def format_prospects(results: Dict[str, Any], format_type: str = "json") -> str:
    """
    Format prospect results for output.
    
    Args:
        results: Search or extraction results
        format_type: Output format ("json", "csv", or "markdown")
    
    Returns:
        Formatted string
    """
    if format_type == "json":
        return json.dumps(results, indent=2)
    
    elif format_type == "csv":
        import csv
        import io
        
        output = io.StringIO()
        writer = csv.writer(output)
        
        # Header
        writer.writerow(["Company", "URL", "Description", "Score"])
        
        # Data
        for result in results.get('results', []):
            writer.writerow([
                result.get('title', ''),
                result.get('url', ''),
                result.get('content', '')[:200] + '...',
                result.get('score', 0)
            ])
        
        return output.getvalue()
    
    else:  # markdown format
        output = "# Business Prospects\n\n"
        
        for i, result in enumerate(results.get('results', []), 1):
            output += f"## {i}. {result.get('title', 'Unknown Company')}\n\n"
            output += f"**Website:** {result.get('url', 'N/A')}\n"
            output += f"**Relevance Score:** {result.get('score', 0):.3f}\n\n"
            
            content = result.get('content', '')
            if content:
                output += f"**Description:**\n{content}\n\n"
            
            raw_content = result.get('raw_content', '')
            if raw_content and len(raw_content) > 500:
                # Extract potential contact info
                import re
                emails = re.findall(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b', raw_content)
                phones = re.findall(r'[\+\(]?[1-9][0-9 .\-\(\)]{8,}[0-9]', raw_content)
                
                if emails or phones:
                    output += "**Potential Contact Info:**\n"
                    if emails:
                        output += f"- Emails: {', '.join(set(emails[:3]))}\n"
                    if phones:
                        output += f"- Phones: {', '.join(set(phones[:3]))}\n"
                    output += "\n"
            
            output += "---\n\n"
        
        return output


def main():
    parser = argparse.ArgumentParser(
        description="Find potential business clients using web search",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Search for SaaS companies in San Francisco
  %(prog)s --industry "SaaS" --location "San Francisco" --size startup
  
  # Find marketing agencies
  %(prog)s --industry "digital marketing agency" --location "New York"
  
  # Extract company information
  %(prog)s --extract https://example-company.com
  
  # Find contact info for a company
  %(prog)s --contact "Acme Corp" --domain acmecorp.com
  
  # Export results as CSV
  %(prog)s --industry "fintech" --format csv > prospects.csv
        """
    )
    
    # Search mode
    parser.add_argument("--industry", help="Industry or business type to search for")
    parser.add_argument("--location", help="Geographic location")
    parser.add_argument("--size", choices=["startup", "SMB", "enterprise"],
                        help="Company size filter")
    parser.add_argument("--terms", nargs="+", help="Additional search terms")
    parser.add_argument("--max-results", type=int, default=10,
                        help="Maximum results (default: 10)")
    
    # Extract mode
    parser.add_argument("--extract", help="Extract info from a company URL")
    
    # Contact mode
    parser.add_argument("--contact", help="Find contact info for company name")
    parser.add_argument("--domain", help="Company domain for contact search")
    
    # Output options
    parser.add_argument("--format", choices=["json", "csv", "markdown"], default="markdown",
                        help="Output format (default: markdown)")
    
    args = parser.parse_args()
    
    # Determine mode
    if args.extract:
        # Extract company information
        results = extract_company_info(args.extract)
        if args.format == "json":
            print(json.dumps(results, indent=2))
        else:
            if results.get('results') and len(results['results']) > 0:
                content = results['results'][0].get('raw_content', 'No content extracted')
                print(f"# Company Information\n\n{content}")
            else:
                print("No information extracted")
    
    elif args.contact:
        # Find contact information
        results = find_contact_info(args.contact, args.domain)
        formatted = format_prospects(results, args.format)
        print(formatted)
    
    elif args.industry:
        # Search for businesses
        results = search_businesses(
            industry=args.industry,
            location=args.location,
            company_size=args.size,
            additional_terms=args.terms,
            max_results=args.max_results
        )
        formatted = format_prospects(results, args.format)
        print(formatted)
    
    else:
        parser.error("Please specify --industry, --extract, or --contact")


if __name__ == "__main__":
    main()