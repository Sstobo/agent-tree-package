# Security Audit Task

## Purpose
Deploy a specialized security swarm to identify vulnerabilities, security risks, and compliance issues across the codebase.

## Swarm Configuration
- **Auth Scanner**: Analyze authentication and authorization patterns
- **Data Protection Agent**: Identify sensitive data handling
- **Vulnerability Hunter**: Search for common security vulnerabilities
- **Dependency Auditor**: Check for known vulnerabilities in dependencies

## Steps

### 1. Initial Security Sweep
Deploy agents in parallel to:
```
- Agent 1: Scan for hardcoded credentials and API keys
- Agent 2: Analyze authentication flows and session management
- Agent 3: Check input validation and sanitization
- Agent 4: Review encryption and data protection
```

### 2. Deep Security Analysis
```
- Agent 5: SQL injection and query safety
- Agent 6: XSS and output encoding
- Agent 7: Access control and authorization checks
- Agent 8: Security headers and configuration
```

### 3. Dependency Security
```
- Agent 9: Scan package.json/requirements for known CVEs
- Agent 10: Check for outdated dependencies
- Agent 11: License compliance verification
```

### 4. Risk Assessment
- Prioritize findings by severity
- Map attack vectors
- Identify defense gaps
- Generate remediation plan

## Output
- Security vulnerability report (Critical/High/Medium/Low)
- Authentication/Authorization analysis
- Data protection assessment
- Dependency security status
- Compliance checklist
- Prioritized remediation roadmap