#!/bin/sh

echo "Updating Submodules..." &&
git submodule update --recursive --remote &&
echo "Adding Files..." &&
git add -A &&
echo "Commiting Changes..." &&
git commit -m "feat: update submodules" &&
echo "Pushing Changes..." &&
git push