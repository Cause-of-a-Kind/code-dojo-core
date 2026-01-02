#!/usr/bin/env bash
set -e

# Code Dojo Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/cause-of-a-kind/code-dojo-core/main/install.sh | bash
# Or: curl -fsSL ... | bash -s -- --dir my-dojo --no-git

REPO_BASE="https://raw.githubusercontent.com/cause-of-a-kind/code-dojo-core/main"
INSTALL_DIR="code-dojo"
INIT_GIT=true

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --dir)
      INSTALL_DIR="$2"
      shift 2
      ;;
    --no-git)
      INIT_GIT=false
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo ""
echo "🥋 Code Dojo Installer"
echo "======================"
echo ""

# Check if directory exists
if [ -d "$INSTALL_DIR" ]; then
  echo "❌ Directory '$INSTALL_DIR' already exists."
  echo "   Remove it or use --dir to specify a different location."
  exit 1
fi

# Check for claude command
if ! command -v claude &> /dev/null; then
  echo "⚠️  Warning: 'claude' command not found."
  echo "   You'll need Claude Code installed to use the dojo."
  echo "   https://claude.ai/code"
  echo ""
fi

echo "📁 Creating $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Create directory structure
mkdir -p skills
mkdir -p workspace/current

# Download framework files
echo "📥 Downloading framework files..."

curl -fsSL "$REPO_BASE/CLAUDE.md" -o CLAUDE.md
curl -fsSL "$REPO_BASE/README.md" -o README.md

# Initialize git repo if requested
if [ "$INIT_GIT" = true ]; then
  echo "📦 Initializing git repository..."
  git init --quiet
  
  # Create a .gitignore
  cat > .gitignore << 'EOF'
# OS files
.DS_Store
Thumbs.db

# Editor files
*.swp
*.swo
*~
.idea/
.vscode/

# Temporary files
*.tmp
*.temp
EOF

  git add .
  git commit --quiet -m "Initialize code dojo"
fi

echo ""
echo "✅ Code Dojo installed successfully!"
echo ""
echo "   Location: $(pwd)"
echo ""
echo "📖 Next steps:"
echo ""
echo "   1. cd $INSTALL_DIR"
echo "   2. claude"
echo "   3. Tell Claude what you want to learn:"
echo ""
echo "      > I want to learn Ruby"
echo ""
echo "   Then just 'train' daily to build your skills."
echo ""
echo "🥋 Train hard. Code well."
echo ""
