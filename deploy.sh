#!/bin/sh
# Publishes this folder to GitHub Pages and waits until the new version is live.
set -e
git add -A
git commit -qm "${1:-Update preview}"
git push -q origin main 2>/dev/null
sha=$(git rev-parse --short HEAD)
base=https://user0856.github.io/agent-ui-demo/ledgerly
echo "Pushed $sha. Waiting for GitHub Pages..."
i=0
while [ $i -lt 90 ]; do
  i=$((i+1))
  if curl -fs "$base/index.html?t=$sha$i" | cmp -s - ledgerly/index.html &&
     curl -fs "$base/style.css?t=$sha$i" | cmp -s - ledgerly/style.css; then
    echo "Live: $base/?v=$sha"
    exit 0
  fi
  sleep 3
done
echo "Timed out waiting for GitHub Pages" >&2
exit 1
