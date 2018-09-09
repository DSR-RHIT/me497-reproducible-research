
# stage-commit-pull-push

We treat the repo as the master version of a project.

The basic steps when collaborating via GitHub are to work locally, stage
your edits and commit them, pull from the repo in case your collaborator
has pushed changes, merge the changes with your own, then push to the
repo.

## git jargon

<!-- - "clone" a project from a remote repo to a local directory  -->

  - *commit* to record changes locally
    <!-- - "conflict" when author and collaborator change the same line of the script at the same time  -->
  - *gitignore* lists local files excused from version control and
    therefore not shared with collaborators
  - *history* illustrates commits by everyone
  - *local* is your personal computer
  - *pull* to fetch files from GitHub and merge with your local version
    of the project
  - *push* to send committed changes to the remote repo
  - *remote* is the GitHub server
    <!-- - "revert" to recover an earlier version of a file  -->
  - *stage* to select files to commit locally

![](../resources/images/git-stage-commit-push-pull.png)<!-- -->

## the collaboration cast

![](../resources/images/alice-thumbnail.jpg)<!-- --> **Alice** is the
Author, the owner of the repository.

![](../resources/images/carlos-thumbnail.jpg)<!-- --> **Carlos** is the
Collaborator whom Alice invited to join her repo.

At the start of your first project, Carlos is me (Richard Layton).
Later, each of you will be Carlos to a classmate’s Alice.

Images  
[Alice](https://goo.gl/sNnslf) (2014) by Thierry Baboulenne, [CC
BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/).  
[Carlos](goo.gl/kTWnIK) (2008) by Anibal de la Torre, [CC
BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/).
Cropped and gray-scaled by RAL.

## alice

Alice has created a repo and sent a collaboration invitation to Carlos.
Once Carlos accepts the invitation, he may have edited or commented some
of the work.

**When you start a project work session**

  - *Pull* before doing additional work

When you pull, you might get a message like this one,

![](../resources/images/stage-before-pull.png)<!-- -->

If you get such a message,

  - *Stage* and *Commit* locally
  - *Pull* in case Carlos made changes in the last few minutes
  - If you spent any time resolving conflicts (we’ll discuss this later)
    *Pull* again
  - *Push*

**When you conclude a project work session**

  - Add to the *gitignore* file for files and directories you want
    excused from version control and therefore not shared with
    collaborators
  - *Stage* and *Commit* locally
  - *Pull* in case Carlos made changes during your session
  - Optionally check *History* to see changes
  - *Push* to GitHub so that your latest edits are available to Carlos

## assignment

For every project
