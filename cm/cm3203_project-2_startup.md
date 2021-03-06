
# project 2 getting started

## prerequisites

These items can be set up before the project is assigned.

  - Create a new repo (if you haven’t already) for project 2
  - Set up a new RStudio Project for project 2
  - Initialize the .gitignore, the directories, etc as we’ve done before
  - Push to the repo

## once project 2 is assigned

  - Initialize the `README.Rmd` to describe the project
  - Invite me to be a collaborator
  - I will have assigned a classmate to be your collaborator. Invite
    them as well.

## use `github_document` output

On project 2, we will use a `github_document` output instead of the
`word_document` output we used on project 1. Thus, when you initialize
the report.Rmd file the YAML header will include

``` 
    ---
    output: github_document
    --
```

The purpose of using the github output is to simplify the collaboration.

  - The page breaks and centering figures we used in the word reference
    style will not be needed.
  - We can auto-number figures and tables
  - References and citations are used in the same way

## when you receive the collaboration invitation

  - Accept the invitation
  - Clone the project to your local computer

Your job as collaborator will be to

  - Regularly pull the project from the repo
  - Launch the main report Rmd
  - Knit it
  - Carefully read it and add questions and comments to improve the
    reader’s understanding of the project: data, analysis, results,
    everything
  - We will add comments using the block quote
    markup

<!-- end list -->

    > Starting a comment with the "greater-than" symbol followed by a space 
      creates a block quote in the document easy for the author to find 

The output looks like this in the github document

> Starting a comment with the “greater-than” symbol followed by a space
> creates a block quote in the document easy for the author to find

## avoiding version conflict

Every time you conclude a work session,

  - Save & pull
  - Remember, you cannot push or pull with unstaged/uncommitted edits
  - Check for conflicts and resolve them
  - Save, pull, then push

Every time you start a work session

  - Pull first
  - Remember, you cannot push or pull with unstaged/uncommitted edits
