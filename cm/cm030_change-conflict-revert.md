
managing changes and conflicts
==============================

See the previous page for your tasks as author and collaborator and for descriptions of git jargon. On this page, we describe:

-   changes without conflicts
-   resolving conflicts
-   reverting to a previous version

changes without conflicts
-------------------------

Via RStudio, the stage-commit-pull-push process will automatically merge everyone's changes in chronological order without fuss unless a conflict occurs.

In the absence of conflicts, Git History shows a tidy, linear sequence of commits. To see the history, in RStudio *Environment* pane, select *Git &gt; History*, for example:

<img src="../resources/images/git-history-1.PNG" width="711" />

-   Each entry is a commit with date and author shown
-   Select an entry in the History window to see the changes that were made in that commit: green highlights are new; red highlights are old
-   Click *View file @* to see the full file associated with that commit.
-   The `SHA` column shows the "secure hash algorithm", a unique identifier for each commit, allowing you to see who did what when and if you want to, revert to a previous version

resolving a conflict
--------------------

Suppose Alice and Carlos are working locally, having pulled from the same version of the remote repo. Assume they both edit the same line of a script.

-   One of them will be first to *stage-commit-pull-push*. No problem.
-   The other will *stage-commit-pull* and receive a CONFLICT message, telling them to "fix conflicts and then commit", for example, "

<img src="../resources/images/conflict-01-pull-message.png" width="631" />

To illustrate a conflict, my collaborator and I both edited the date in the YAML header of one of the calibration project scripts.

RStudio IDs the conflict with `<<<<<<<< HEAD` and `>>>>>>>> long SHA number`, for example,

<img src="../resources/images/conflict-02-brackets-shown.png" width="394" />

In the Rmd script,

-   Keep the version of the conflicted lines you want
-   Delete the conflicted version you don't want
-   Delete `<<<<<<<< HEAD` and `>>>>>>>> long SHA number`
-   *Save*, *stage*, *commit*. The commit message should state what conflict was resolved.
-   *Pull* again (just in case the other person has pushed while you were working)
-   *Push*

When the conflict is resolved, the history graphically illustrates the conflict as a branch and the resolution as a merging of the branch with the main trunk. In this example, `graphdr` was the author and Micah was the collaborator. Micah resolved the conflict.

<img src="../resources/images/conflict-03-resolved-history.png" width="714" />

revert modifications
--------------------

If you make changes to files and find that you no longer need the changes, you can *revert* the changes. This resets the file to the last version in the repository, erasing any changes you have made. **Be careful!!** There is no way to undo a revert.

-   Find the file you wish to revert in the Git tab
-   Right click on the file and choose "Revert..."
-   Verify this is the correct file and confirm the warning

<img src="../resources/images/revert-git-context-menu.png" width="472" />

------------------------------------------------------------------------

[main page](../README.md)
