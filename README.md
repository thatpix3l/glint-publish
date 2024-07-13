# Publish Glint Web & API
Automate the "build & publish" process for `glint-api` and `glint-web` repos, with the power of GitHub Actions!

## Manually Trigger
Steps:

 1. Clone Repo
 2. Update Cubmodules
 3. Commit Changes
 4. Push

```bash
git clone --recurse-submodules https://github.com/vectorsquad/glint-publish
git submodule update --remote --merge
git commit -m "feat: update submodules"
git push
```

