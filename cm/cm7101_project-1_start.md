
# project 1

## getting started

Select a technical report from your past work in any course

  - Start looking through your archives from earlier courses for a
    report you wrote dealing with data, analysis, and reporting
    something like the sample calibration report
  - Find two or three you think might be suitable

The report has to include these features

  - Imports an image, for example, an apparatus
  - Includes quantitative data that is used in some analysis to produce
    results
  - Includes a data table
  - Includes a graph to display quantitativeresults from the analysis
  - Show “in-line” results in the text of the report
  - Includes equation(s)
  - Citations and
references

<!-- ## set up a new repo -->

<!-- Using your GitHub student academic account:  -->

<!-- - Create a new repo called `me497-project-2-yourLastName`, replacing `yourLastName` with your actual last name  -->

<!-- - Make the repo private  -->

<!-- - Check the `Initialize this repository with a README` box  -->

<!-- - `Add gitignore` and choose `R`  -->

<!-- - A license is optional (private repos for classwork don't generally need a license)  -->

<!-- - `Create repository`  -->

<!-- Invite me to be your collaborator  -->

<!-- - In the repo, click on the `Settings` icon.  -->

<!-- - Click on the `Collaborators` tab  -->

<!-- - In the `Search by username` box, type my GitHub name `graphdr`, click `Add collaborator` to add me as a collaborator to your project  -->

<!-- Once I've assigned you a classmate to reproduce your work, you will invite them to be a collaborator too.  -->

<!-- In the repo main page, click `Clone or download` and copy that URL. We'll use it below.   -->

<!-- ## create a new project with version control  -->

<!-- In RStudio, create a new project:  -->

<!-- - RStudio *File > New Project > Version control > Git*  -->

<!-- - In the dialog  box, paste the repo URL, and edit the path so that the new project is a sub-directory of your course folder.  -->

<!-- ## setup the project directory tree -->

<!-- In your new project directory, create new folders (sub-directories) for `data\`, `reports\`, `resources\`, `results\`, and `scripts\`.  -->

<!-- Copy your  `.Renviron` file and save it in the project folder.  -->

<!-- Your directory should look like this:  -->

<!-- ``` -->

<!-- me497-project-2-YourLastName\ -->

<!--   |-- data\ -->

<!--   |-- reports\ -->

<!--   |-- resources\ -->

<!--   |-- results\ -->

<!--   |-- scripts\ -->

<!--   |-- me497-project-2-YourLastName.Rproj -->

<!--   |-- .Renviron -->

<!--   |-- .gitignore -->

<!--   `-- README.md -->

<!-- ``` -->

<!-- Edit the `README.md` file to give your collaborator an overview of the work.  -->

<!-- A summary of each directory -->

<!-- - `data\` for raw data and processed data used by subsequent steps in the analysis, but not results that are reported. For long-term projects, you could have dated sub-directories inside `data\` for raw data files, e.g., `2016-09-18_raw-data\`  -->

<!-- - `reports\` for the Rmd scripts  that create the final report for the client and the formatted output file (Word, PDF, HTML)   -->

<!-- - `resources\` for non-data, non-text files supplied by someone else, e.g., images, PPTX or DOCX files sent by a collaborator.  -->

<!-- - `results\` for tables and graphs produced by your scripts at various points in your work that would possibly be included in a report to a client. Results files are named after the  Rmd script that produced them.  -->

<!-- - `scripts\` for Rmd scripts that do the work. Scripts should be numbered consecutively as you do the work.  -->

<!-- Additional directories you might find useful at some point:  -->

<!-- - `manage\` directory for project management files that are not needed for project reproducibility. You can add the file name to your `.gitignore` file and the entire directory will be ignored by the version control system.  -->

<!-- - `slides\` directory is a subset of reports, but I sometimes keep them in their own directory.  -->

<!-- - `print-pages\` directory for pages you intend to print and handout physically. Like slides, this could be considered a subset of reports. Your mileage may vary.   -->

<!-- - `matlab\` or `python\` directories, for example, for non-R scripts you might be using. If these scripts are prt of the reproducible work flow, the files should be invoked fromn within the Rmd scripts just like the R code is. If not part of the work flow, you can have git ignore them.  -->

<!-- ## plan the script outline   -->

<!-- Project 1 illustrated a fairly conventional set of Rmd scripts -->

<!-- - `01_proj-abbv_data-explore.Rmd` to initially examine the data set. This might be omitted if ytou were the one creatinmg the data in the first place.   -->

<!-- - `02_proj-abbv_data-tidy.Rmd` to get the data into *tidy form* (or *long form*) prior to analysis.  -->

<!-- - `03_proj-abbv_graph-draft.Rmd` to crfeate a preliminary graph, not for publication, but just to examine the data before doing the analysis.  -->

<!-- - `04_proj-abbv_analysis.Rmd` to start the analysis. Depending on the scope of the analysis, there may be several, consecutuively numbered analysis scripts, each one performing a specific task.  -->

<!-- - `05_proj-abbv_graph.Rmd` for producing the publication quality graph. Here too you might have several, consecutuively numbered graph scripts, each one creating a specific graph.  -->

<!-- - `06_proj-abbv_report.Rmd` for the client report  -->

<!-- The two-digit number that begins a script is subject to change as your work proceeds. But thinking ahead of time about the files you might need provides a mental map of the project that helps you manage the work flow logiocally and consistently.  -->

<!-- ## remember our guidelines for scripts  -->

<!-- - a script should perform one task  -->

<!-- - short, between 60--100 lines  -->

<!-- - generally produces one object written to file, e.g., CSV, PNG  -->

<!-- ## finally  -->

<!-- Stage, Commit, and Push to GitHub.  -->

-----

[main page](../README.md)
