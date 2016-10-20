
.Rproj won't launch
===================

A few of you encountered a problem recently when trying launch your `project_name.Rproj` file---the file would not open, meaning of course you couldn't work on the project. Eek!

You received an error message that reads something like:

> Project `project_name.Rproj` could not be opened: file line number NN is invalid.

where `NN` is an integer line number in the .Rproj file.

cause
-----

The trouble arose due to a version conflict in the `project_name.Rproj` file. The conflict was completely unintentional and could have been caused by the repo author, a collaborator, or a reviewer.

Someone inadvertently reset the RStudio option *Tools &gt; Project Options* or *Global Options*, sub-tab *Sweave*, pulldown menu labeled *Weave Rnw files using:* from the correct value `knitr` to the legacy value `Sweave`. Like knitr, Sweave is a package for compiling prose and code output in the same document.

All RStudio options are stored in the `project_name.Rproj` file. Because we have been including this file in version control, as soon as one member of the team changed their project options, the next person to PULL that file received a version conflict.

And conflicts have to be resolved before the files can be merged.

identifying the conflict
------------------------

When git identifies a conflict, it adds new text to the file to show you the conflict.

When this happened to the `project_name.Rproj` file, the extra lines of text made the file executable. That's why you couldn't launch your project.

To see the conflict, I opened the `project_name.Rproj` file in a non-R text editor such as Notepad. It looked like this:

    Version: 1.0

    RestoreWorkspace: Default
    SaveWorkspace: Default
    AlwaysSaveHistory: Default

    EnableCodeIndexing: Yes
    UseSpacesForTab: Yes
    NumSpacesForTab: 2
    Encoding: UTF-8

    <<<<<<< HEAD
    RnwWeave: Sweave
    =======
    RnwWeave: knitr
    >>>>>>> 5473fedc9c4116f22c88c92be4b5c936477c4b56
    LaTeX: pdfLaTeX

The lines bounded by the symbols `<<<<<<<` and `>>>>>>> 5473fedc9c...` are the lines of text inserted by git to identify the conflict.

-   The lines of code that are in conflict are separated by `=======`
-   The long identifier (`5473fedc9c...`) is the "hash" for the commit that brought about the conflict
-   These extra lines also make the file unreadable by RStudio

So, looking at the identifiers, we see there is only one line in conflict. One person set the `RnwWeave` option to `Sweave` (inadvertently I'm sure) and the other person had correctly set this option to `knitr`.

resolving the conflict
----------------------

The correction is actually fairly straightforward.

-   Open the `project_name.Rproj` file in Notepad (or any non-RStudio text editor)
-   Keep the conflicted lines you want to keep, e.g., `RnwWeave: knitr`
-   Delete the conflicted lines you want to omit, e.g., `RnwWeave: Sweave`
-   Delete the extra lines added by git. In this example, the corrected file looks like:

<!-- -->

    Version: 1.0

    RestoreWorkspace: Default
    SaveWorkspace: Default
    AlwaysSaveHistory: Default

    EnableCodeIndexing: Yes
    UseSpacesForTab: Yes
    NumSpacesForTab: 2
    Encoding: UTF-8

    RnwWeave: knitr
    LaTeX: pdfLaTeX

-   Save it as `project_name.Rproj`
-   You should now be able to launch the file in RStudio as usual. Try it.

To prevent future conflicts of this sort, please read [Preventable version control conflicts](cm044_preventable-vc-conflicts.md)

------------------------------------------------------------------------

[main page](../README.md)