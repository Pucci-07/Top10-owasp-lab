#!/bin/bash

# OWASP Top 10 Lab - Setup Script

echo "🛡️  OWASP Top 10 Vulnerable Applications Lab"
echo "============================================="
echo ""

# Vérifier que Docker et Docker Compose sont installés
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé. Veuillez installer Docker."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose n'est pas installé. Veuillez installer Docker Compose."
    exit 1
fi

echo "✅ Docker et Docker Compose trouvés"
echo ""

# Construire et démarrer les services
echo "🚀 Démarrage des applications vulnérables..."
docker-compose up -d

echo ""
echo "✅ Les labs sont maintenant en ligne!"
echo ""
echo "📚 Accédez aux applications:"
echo "   A1  - Broken Access Control:              http://localhost:5001"
echo "   A2  - Cryptographic Failures:             http://localhost:5002"
echo "   A3  - Injection:                          http://localhost:5003"
echo "   A4  - Insecure Design:                    http://localhost:5004"
echo "   A5  - Security Misconfiguration:         http://localhost:5005"
echo "   A6  - Vulnerable Components:             http://localhost:5006"
echo "   A7  - Authentication Failures:           http://localhost:5007"
echo "   A8  - Integrity Failures:                http://localhost:5008"
echo "   A9  - Logging Failures:                  http://localhost:5009"
echo "   A10 - SSRF:                              http://localhost:5010"
echo ""
echo "📖 Consultez les README.md dans chaque dossier pour les détails d'exploitation"
echo ""
echo "🛑 Pour arrêter les services: docker-compose down"
