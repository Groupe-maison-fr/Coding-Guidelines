---
sort: 3
---

## Bug-fix branches

[source](https://gitlab.eurecom.fr/oai/openair-ci-sandbox/-/wikis/policy/branch-policy)

Bug-fix branches are very much like release branches in that they are also meant to prepare for a new production release, albeit unplanned.
They arise from the necessity to act immediately upon an undesired state of a live production version.
When a critical bug in a production version must be resolved immediately, a bug-fix branch may be branched off from the corresponding tag on the `master` branch that marks the production version.
The essence is that work of team members (on the `master` branch) can continue, while another person is preparing a quick production fix.
Bug-fix branches **SHALL** be deleted once the bug fix has been integrated to `master` branches and validated through Continuous Integration.


May branch off from `master`

Must merge back into `master`

Branch naming convention: `fix-XXXX-****`

A ticket **SHALL HAVE BEEN** opened for this issue
The ticket ID **SHALL** be refered in branch name: `fix-0012-****`
