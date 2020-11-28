---
sort: 2
---

## Feature branches

[source](https://gist.github.com/rowland007/c01e21f7a35c935110af5659fd8c7600)

Feature branches (or sometimes called topic branches) are used to develop new features for the upcoming or a distant future release.
When starting development of a feature, the target release in which this feature will be incorporated may well be unknown at that point.
The essence of a feature branch is that it exists as long as the feature is in development, but will eventually be merged back into `master` (to definitely add the new feature to the upcoming release) or discarded (in case of a disappointing experiment).
These branches always have a limited life time.
Feature branches are created in `origin` so multiple developers can push to the same feature branch with some coordination amongst each other.


- May branch off from master
- Must merge back into master
- Branch naming convention: `reason-XXX-****`, ie `feat-321-****`. Where `****` is a short title (max 3-4 terms).
    
if a ticket has been opened for this feature, it should be refered in branch name: feat-0012-****

### Creation of a feature branch

[source](https://gitlab.eurecom.fr/oai/openair-ci-sandbox/-/wikis/policy/branch-policy)

When starting work on a new feature, branch off from the latest `master` branch.
```
# Retrieve the latest version of code
$ git fetch origin
# Create a feature branch on the latest master
$ git checkout -b feat-321-my-example
# Now you are switched to the new branch
```

### Committing

[source](https://gitlab.eurecom.fr/oai/openair-ci-sandbox/-/wikis/policy/branch-policy)

Now you can start working on your branch.

- Commit your code regularly and use commit messages to describe your changes.
- Atomic commit : A single commit should not contain too many changes at the same time.
- Every commit **SHALL** be signed.

```
# back into the feature branch
$ git checkout feat-0001-my-example
# add new file(s) and commit with a proper message
$ git add newfile
# commit should be signed
$ git commit -s
```

If your development takes longer, make sure to synchronize regularly with `origin/master` using:
```
$ git checkout feat-0001-my-example
# Retrieve the latest and rebase the feature branch with master
$ git fetch origin
$ git rebase origin/master
```

However you may have forgotten to do the `rebase` for a long time. The `git rebase` process is replaying all the commits from the `master` branch.

In case of merge conflicts, it can be painful because you may have to resolve conflicts several times. The rebase will stop each time you have a conflict, you need to resolve it manually and then continue the rebase. In that case it certainly better (not necesserily easy) to resolve merge conflicts at once.

```
$ git checkout feat-0001-my-example
# Retrieve the latest from master and merge into feature branch
$ git fetch origin
$ git merge origin/master
```
**IT IS THE DEVELOPER/CONTRIBUTOR'S RESPONSABILITY TO PERFORM REGULAR MERGES ONTO ITS FEATURE BRANCH**

### Pushing into the central repository

To have a backup, to collaborate with other people, or to create a merge request, you should push your code also regularly to the gitlab/github server.
```
$ git push origin feat-0001-my-example
```

After a rebase you will have to force push:
```
$ git push --force--with-lease origin feat-0001-my-example
```
