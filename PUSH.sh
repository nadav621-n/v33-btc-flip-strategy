#!/bin/bash
# Run this once from inside the github-repo folder to push to GitHub
# Requires: gh CLI installed and authenticated

REPO_NAME="v33-btc-flip-strategy"

echo "Creating GitHub repository: $REPO_NAME"
gh repo create "$REPO_NAME" --public --description "BTC trend-following flip strategy: +4,909% over 6 years on Bybit. Backtested through 2022 crash, FTX collapse, 2024 bull run."

echo "Initializing git..."
git init
git add .
git commit -m "Initial: v33 BTC flip strategy — 6yr backtest results and methodology"
git branch -M main
git remote add origin "https://github.com/$(gh api user --jq .login)/$REPO_NAME.git"
git push -u origin main

echo ""
echo "Done! Your repo is live at:"
echo "https://github.com/$(gh api user --jq .login)/$REPO_NAME"
