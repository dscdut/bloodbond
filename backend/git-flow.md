# Git flow handling

## Branches

**develop**: for development

**staging**: for testing

**main**: for deploy to production

## Handle new feature

1. `git checkout develop && git pull`

2. `git checkout -b feature/<name> && git push -u origin feature/<name>`

3. Repeat `git add && git commit`, eventually `git push`, until the feature is done

4. Create a Pull Request (PR) targeting the `develop` branch and call for any DEV to review it

5. Do the requested changes, if necessary, until approval

## Handle bugs

1. `git checkout main && git pull`

2. `git checkout -b hot-fix/<name> && git push -u origin hotfix/<name>`

3. Repeat `git add && git commit`, eventually `git push`, until the fix is done

4. One PR to `main` (the actual code going to production)
5. One PR back to `develop` (yes, this is required to keep main, dev and future releases with the required bugfix code)


## Handle conflicts

1. Checkout to target branch -> pull latest code

2. Checkout to source branch: merge or rebase target branch -> handle conflicts

3. Commit, push to remote -> create PR to target branch
