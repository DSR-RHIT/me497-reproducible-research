
# initialize project 1

## start a private repo

If you haven’t requested a GitHub student academic account, please do
<https://education.github.com/pack>. On GitHub:

  - Create a repo called `me497-project-1-yourLastName`, replacing
    `yourLastName` with your actual last name
  - Make the repo private
  - Check the `Initialize this repository with a README` box
  - `Add gitignore` and choose `R`
  - A license is optional (private repos for classwork don’t generally
    need a license)
  - `Create repository`

Invite me to be your collaborator

  - In the repo, click on the `Settings` icon.
  - Click on the `Collaborators` tab
  - In the `Search by username` box, type my GitHub name `graphdr`,
    click `Add collaborator` to add me as a collaborator to your project

In the repo main page, click `Clone or download` and copy that URL.
We’ll use it below.

## create a new project with version control

In RStudio, create a new project:

  - RStudio *File \> New Project \> Version control \> Git*
  - In the dialog box, paste the repo URL, and edit the path so that the
    new project is a sub-directory of your course folder.

Check your course folder. It should now contain a folder
`me497-project-1-yourLastName`.

Inside the `me497-project-1-yourLastName`folder you should find

  - `me497-project-1-yourLastName.Rproj`  
  - `.gitignore`  
  - `README.md`

## setup the project directory tree

In your project directory, create new folders (sub-directories) for
`data\`, `reports\`, `resources\`, `results\`, and `scripts\`. Earlier
you created a `.Renviron` file. Save a copy in the project folder.

Your directory should look like this:

    me497-project-1-YourLastName\
      |-- data\
      |-- manage\
      |-- reports\
      |-- resources\
      |-- results\
      |-- scripts\
      |-- me497-project-1-YourLastName.Rproj
      |-- .Renviron
      |-- .gitignore
      `-- README.md

Over time, of course, you will settle on you own approach to file
organization. For this project, we’ll all use this one.

-----

[main page](../README.md)
