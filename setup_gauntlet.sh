#!/usr/bin/env bash
# Koredex Gauntlet — one-shot setup. Run from inside the extracted folder
# in Git Bash. Creates the repo, main, and all five seed branches.
set -e

git init -b main .
git add -A
git commit -m "gauntlet: green main with branch-activated failure scenarios"

# --- seed/your-code: PR breaks calc.py itself (exception INSIDE source) ---
git checkout -b seed/your-code
cat > calc.py << 'EOF'
"""Toy source module — the 'your code' surface."""


def add(a, b):
    raise TypeError("broken by this PR: add() is defective")


def multiply(a, b):
    return a * b
EOF
git commit -am "seed/your-code: break add() in calc.py"

# --- the other four seeds change ONLY the README (dummy touch) ---
for seed in flaky not-your-code dependency infra; do
  git checkout main
  git checkout -b "seed/$seed"
  echo "seed touch: $seed" >> README.md
  git commit -am "seed/$seed: dummy change (README only)"
done

git checkout main
echo ""
echo "Branches created:"
git branch
echo ""
echo "NEXT STEPS:"
echo "1. Create empty PUBLIC repo 'koredex-gauntlet' on github.com (no README)."
echo "2. git remote add origin https://github.com/<YOUR_USER>/koredex-gauntlet.git"
echo "3. git push -u origin main && git push origin --all"
echo "4. Install the koredex CI App on this repo (App settings -> Install App)."
echo "5. Open 5 PRs on GitHub, one per seed/* branch, base = main."
