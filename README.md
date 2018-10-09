
# reproducible research

497 / 597 Reproducible Research. An introductory course for the R novice
by Richard Layton at Rose-Hulman Institute of Technology.

  - [About the course](cm/cm0001_about-the-course.md)  
  - [Syllabus](cm/cm0003_syllabus.md)
  - [Index](#index)
  - [Help links](cm/cm0004_getting-help.md)  
  - [License](LICENSE.md)

<!-- - [Project due dates](cm/cm002a_deadlines.md)  -->

![](resources/images/rr-flow-2.png)

## calendar

Readings in the text refer to sections in the the online
version.

| w  | d | agenda                                                                                                                            | text                                                                                                                                                                                                                                                                                                                                    | exer                                                                                                                                                                                     | activities                                                                                                                                                                                                                              | projects                                                                                                       | due                                                                             |
| :- | :- | :-------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------ |
| 0  | R | Course introduction \[[S](slides/cm4001_introduction.pdf)\]<br>Review calendar                                                    | [1.1 – 1.6](http://r4ds.had.co.nz/introduction.html)                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | [Read syllabus](cm/cm0003_syllabus.md)<br>[Install R & RStudio](cm/cm1001_install-R-RStudio.md)<br>[Install git](cm/cm1002_install-git.md)<br>[Create library](cm/cm1003_library.md)                                                    | [Meet 597](cm/cm3301_project-3_start.md)                                                                       | Meet 597                                                                        |
|    | F | Reproducible workflows \[[S](slides/cm4002_principles.pdf)\]                                                                      | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | [Setup GitHub](cm/cm1004_setup-github.md)<br>[Create repos](cm/cm1005_create-repo.md)<br>[Create Rproj](cm/cm1006_setup-Rproj.md)<br>[Create Renviron](cm/cm1007_Renviron.md)                                                           | [Proposal 1](cm/cm3101_project-1-select.md)<br>[Proposal 3](cm/cm3301_project-3_start.md)                      | Meet 597                                                                        |
| 1  | M | Starting with R Markdown \[[S](slides/cm4003_rmarkdown.pdf)\]<br>Collaboration basics                                             | [27.1 – 27.6](http://r4ds.had.co.nz/r-markdown.html)<br>\[[L](cm/cm5005_how-to-collab.md)\]                                                                                                                                                                                                                                             | [](http://r4ds.had.co.nz)                                                                                                                                                                | [Setup directories](cm/cm1008_setup-directories.md)<br>[Edit gitignore](cm/cm1009_gitignore.md)<br>[Invite collaborator](cm/cm1010_invite-collab.md)<br>[Commits](cm/cm1011_basic-collab.md)<br>[Edit README](cm/cm1012_edit-readme.md) | <br>                                                                                                           | Meet 597                                                                        |
|    | T | Intro graphs<br>First steps<br>Aesthetics                                                                                         | [3.1](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)<br>[3.2](http://r4ds.had.co.nz/data-visualisation.html#first-steps)<br>[3.3](http://r4ds.had.co.nz/data-visualisation.html#aesthetic-mappings)                                                                                                                      | []()<br>[3.2.4](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)<br>[3.3.1](http://r4ds.had.co.nz/data-visualisation.html#exercisess-1)                                     | [How to practice](practice_work/exercisess/8001_practice-work-setup.md)<br>Browse R1                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | R | Facets<br>Geoms                                                                                                                   | [3.5](http://r4ds.had.co.nz/data-visualisation.html#facets)<br>[3.6](http://r4ds.had.co.nz/data-visualisation.html#geometric-objects)                                                                                                                                                                                                   | [3.5.1](http://r4ds.had.co.nz/data-visualisation.html#exercisess-2)<br>[3.6.1](http://r4ds.had.co.nz/data-visualisation.html#exercisess-3)                                               | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F | R coding basics                                                                                                                   | [4.1](http://r4ds.had.co.nz/workflow-basics.html)<br>[4.2](http://r4ds.had.co.nz/workflow-basics.html#whats-in-a-name)<br>[4.3](http://r4ds.had.co.nz/workflow-basics.html#calling-functions)                                                                                                                                           | [4.4](http://r4ds.had.co.nz/workflow-basics.html#practice)                                                                                                                               | []()                                                                                                                                                                                                                                    | []()                                                                                                           | Proposal 1<br>Proposal 3                                                        |
| 2  | M | References \[[S](slides/cm4004_references-word-styles.pdf)\]<br>Controlling Word styles                                           | \[[L](cm/cm5011_references.md)\]<br>\[[L](https://rmarkdown.rstudio.com/articles_docx.html)\]                                                                                                                                                                                                                                           | [](http://r4ds.had.co.nz)                                                                                                                                                                | [References](cm/cm1013_references.md)<br>[Word styles](cm/cm1014_word-styles.md)<br>Study R1                                                                                                                                            | [P1 Draft](cm/cm3102_project-1-draft.md)<br>[Feedback response](cm/cm1015_feedback-response.md)                | []()                                                                            |
|    | T | Discuss R1: [What does reproducibility mean?](resources/readings/2016-Goodman-et-al-what-does-RR-mean.pdf)                        | [](http://r4ds.had.co.nz)                                                                                                                                                                                                                                                                                                               | [](http://r4ds.had.co.nz)                                                                                                                                                                | []()                                                                                                                                                                                                                                    | []()                                                                                                           | R1 [Reading response](resources/readings/reading-response.pdf)                  |
|    | R | Data basics: filter(), arrange()                                                                                                  | [5.1](http://r4ds.had.co.nz/transform.html#introduction-2)<br>[5.2](http://r4ds.had.co.nz/transform.html#filter-rows-with-filter)<br>[5.3](http://r4ds.had.co.nz/transform.html#arrange-rows-with-arrange)                                                                                                                              | []()<br>[5.2.4](http://r4ds.had.co.nz/transform.html#exercisess-7)<br>[5.3.1](http://r4ds.had.co.nz/transform.html#exercisess-8)                                                         | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F | Data basics: select(), mutate()                                                                                                   | [5.4](http://r4ds.had.co.nz/transform.html#select)<br>[5.5](http://r4ds.had.co.nz/transform.html#add-new-variables-with-mutate)                                                                                                                                                                                                         | [5.4.1](http://r4ds.had.co.nz/transform.html#exercisess-9)<br>[5.5.2](http://r4ds.had.co.nz/transform.html#exercisess-10)                                                                | []()                                                                                                                                                                                                                                    | [P3 schedule](cm/cm3302_project-3_meet-week-6-goals.md)                                                        | Revised proposal 3                                                              |
| 3  | M | Page breaks<br>Centering figures<br>Numbering figures & tables<br>Preparing work for transmittal                                  | \[[L](cm/cm5012_page-breaks.md)\]<br>\[[L](cm/cm5013_centering-figs.md)\]<br>\[[L](cm/cm5014_captioner.md)\]<br>L                                                                                                                                                                                                                       | [](http://r4ds.had.co.nz)                                                                                                                                                                | [Page breaks](cm/cm1016_page-breaks.md)<br>[Centering](cm/cm1017_centering-figs.md)<br>[Auto-numbering](cm/cm1018_captioner.md)<br>File functions                                                                                       | []()                                                                                                           | []()                                                                            |
|    | T | Data basics: summarize()                                                                                                          | [5.6](http://r4ds.had.co.nz/transform.html#grouped-summaries-with-summarise)                                                                                                                                                                                                                                                            | [5.6.7](http://r4ds.had.co.nz/transform.html#exercises-11)                                                                                                                               | Browse R2                                                                                                                                                                                                                               | []()                                                                                                           | []()                                                                            |
|    | R | R code basics: tibble()                                                                                                           | [10.1](http://r4ds.had.co.nz/tibbles.html)<br>[10.2](http://r4ds.had.co.nz/tibbles.html#tibbles)<br>[10.3](http://r4ds.had.co.nz/tibbles.html#tibbles-vs.data.frame)<br>[10.4](http://r4ds.had.co.nz/tibbles.html#interacting-with-older-code)                                                                                          | [10.5](http://r4ds.had.co.nz/tibbles.html#exercises-18)                                                                                                                                  | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F | Read and write data                                                                                                               | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | [Data import](cm/cm1020_readr_exceptions.md)                                                                                                                                                                                            | [P2 candidates](cm/cm3201-project-2-candidates.md)                                                             | []()                                                                            |
| 4  | M | Managing version control changes and conflicts                                                                                    | \[[L](cm/cm1021_conflict-revert.md)\]                                                                                                                                                                                                                                                                                                   | [](http://r4ds.had.co.nz)                                                                                                                                                                | Study R2<br>[Resolve v-c conflict](cm/cm1022_conflict-assignment.md)                                                                                                                                                                    | []()                                                                                                           | P3 raw data                                                                     |
|    | T | Discuss R2: [Shining light into black boxes](resources/readings/2012-Morin-Shining-light-into-black-boxes.pdf)                    | [](http://r4ds.had.co.nz)                                                                                                                                                                                                                                                                                                               | [](http://r4ds.had.co.nz)                                                                                                                                                                | []()                                                                                                                                                                                                                                    | []()                                                                                                           | P2 preference<br>R2 [Reading response](resources/readings/reading-response.pdf) |
|    | R | Factors                                                                                                                           | [15.1](http://r4ds.had.co.nz/factors.html#introduction-9)<br>[15.2](http://r4ds.had.co.nz/factors.html#creating-factors)<br>[15.3](http://r4ds.had.co.nz/factors.html#general-social-survey)<br>[15.4](http://r4ds.had.co.nz/factors.html#modifying-factor-order)<br>[15.5](http://r4ds.had.co.nz/factors.html#modifying-factor-levels) | <br><br>[15.3.1](http://r4ds.had.co.nz/factors.html#exercise)<br>[15.4.1](http://r4ds.had.co.nz/factors.html#exercises-43)<br>[15.5.1](http://r4ds.had.co.nz/factors.html#exercises-44s) | []()                                                                                                                                                                                                                                    | P2 assigned<br>[P2 start-up](cm/cm3203_project-2_startup.md)<br>[P2 schedule](cm/cm3202_project-2_schedule.md) |                                                                                 |
|    | F | Graph tour<br>Dot plots<br>Communicating<br>Labels<br>Annotations                                                                 | \[[L](cm/cm5016_graph-tour-overview.md)\]<br>\[[L](cm/cm5019_dot-plot.md)\]<br>[28.1](http://r4ds.had.co.nz/graphics-for-communication.html)<br>[28.2](http://r4ds.had.co.nz/graphics-for-communication.html#label)<br>[28.3](http://r4ds.had.co.nz/graphics-for-communication.html#annotations)                                        | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
| 5  | M | Tidy data: spread(), gather(), separate(), unite()                                                                                | [12.1](http://r4ds.had.co.nz/tidy-data.html)<br>[12.2](http://r4ds.had.co.nz/tidy-data.html#tidy-data-1)<br>[12.3](http://r4ds.had.co.nz/tidy-data.html#spreading-and-gathering)<br>[12.4](http://r4ds.had.co.nz/tidy-data.html#separating-and-uniting)                                                                                 | []()<br>[]()<br>[12.3.3](http://r4ds.had.co.nz/tidy-data.html#exercises-22)<br>[12.4.3](http://r4ds.had.co.nz/tidy-data.html#exercises-23)                                               | []()                                                                                                                                                                                                                                    | []()                                                                                                           | P3 tidy data                                                                    |
|    | T | Multiway data & graphs<br>Scales<br>Sizing and saving                                                                             | \[[L](cm/cm5020_multiway.md)\]<br>[28.4](http://r4ds.had.co.nz/graphics-for-communication.html#scales)<br>[28.7](http://r4ds.had.co.nz/graphics-for-communication.html#saving-your-plots)                                                                                                                                               | []()                                                                                                                                                                                     | Browse R3                                                                                                                                                                                                                               | []()                                                                                                           | P1 Final report                                                                 |
|    | R | Work on projects<br>(prof at conference)                                                                                          | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F | Work on projects<br>(prof at conference)                                                                                          | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
| 6  | M | Missing values, case study in tidying data                                                                                        | [12.5](http://r4ds.had.co.nz/tidy-data.html#missing-values-3)<br>[12.6](http://r4ds.had.co.nz/tidy-data.html#case-study)                                                                                                                                                                                                                | <br>[12.6.1](http://r4ds.had.co.nz/tidy-data.html#exercises-25)                                                                                                                          | Study R3<br>[Case study](cm/cm5021_case-study.md)                                                                                                                                                                                       | []()                                                                                                           | P3 results                                                                      |
|    | T | Discuss R3: [Ten simple rules for reproducible computational research](resources/readings/2013-Sandve-et-al-Ten-simple-rules.pdf) | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | R3 [Reading response](resources/readings/reading-response.pdf)                  |
|    | R | break                                                                                                                             | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F | break                                                                                                                             | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
| 7  | M |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | P2 raw data<br>P3 deliverables                                                  |
|    | T |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | Browse R4                                                                                                                                                                                                                               | []()                                                                                                           |                                                                                 |
|    | R |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
| 8  | M |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | Study R4                                                                                                                                                                                                                                | []()                                                                                                           | P2 tidy data                                                                    |
|    | T | Discuss R4: [Reproducible research can still be wrong](resources/readings/2015-Leek-Peng-RR-can-still-be-wrong.pdf)               | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | R4 [Reading response](resources/readings/reading-response.pdf)                  |
|    | R |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
| 9  | M |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | P2 results                                                                      |
|    | T |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | Browse R5                                                                                                                                                                                                                               | []()                                                                                                           |                                                                                 |
|    | R |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
| 10 | M |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | Study R5                                                                                                                                                                                                                                | []()                                                                                                           | []()                                                                            |
|    | T | Discuss R5: [Reproducible research: a dissenting opinion](resources/readings/2012-Drummond-RR-dissenting-opinion.pdf)             | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | R5 [Reading response](resources/readings/reading-response.pdf)                  |
|    | R |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | []()                                                                            |
|    | F |                                                                                                                                   | []()                                                                                                                                                                                                                                                                                                                                    | []()                                                                                                                                                                                     | []()                                                                                                                                                                                                                                    | []()                                                                                                           | P2 Final report<br>P3 Final report                                              |

# index

## course things

  - [About the course](cm/cm0001_about-the-course.md)
  - [Syllabus](cm/cm0003_syllabus.md)  
  - [Help links](cm/cm0004_getting-help.md)
  - Course introduction \[[S](slides/cm4001_introduction.pdf)\]

## data things

  - [Tidy data case study](cm/cm5021_case-study.md), an adaptation of
    text section [12.6](http://r4ds.had.co.nz/tidy-data.html#case-study)

## file management

  - Reproducible workflows \[[S](slides/cm4002_principles.pdf)\]  
  - [Setup the project directories](cm/cm1008_setup-directories.md)

## graph things

  - [Dot plots](cm/cm5019_dot-plot.md)
  - [Multiway data and graphs](cm/cm5020_multiway.md)

## git things

*Set up*

  - [Install git locally](cm/cm1002_install-git.md)
  - [Setup a GitHub account](cm/cm1004_setup-github.md)
  - [Edit the .gitignore file](cm/cm1009_gitignore.md)

*For a project*

  - [Create a repository](cm/cm1005_create-repo.md)
  - [Create a version-controlled R project](cm/cm1006_setup-Rproj.md)
  - [Invite a GitHub collaborator](cm/cm1010_invite-collab.md)
  - [Collabration basics](cm/cm5005_how-to-collab.md)
  - [Commit to a repo](cm/cm1011_basic-collab.md)
  - [Create the README.Rmd](cm/cm1012_edit-readme.md)

## project assignments

*Project 1*

  - [Proposal](cm/cm3101_project-1-select.md)
  - [Feedback response](cm/cm1015_feedback-response.md)
  - [Begin first draft](cm/cm3102_project-1-draft.md)

*Project 2*

  - [List of candidate projects](cm/cm3201-project-2-candidates.md)
  - [Start-up information](cm/cm3203_project-2_startup.md)
  - [Brief progress schedule](cm/cm3202_project-2_schedule.md)

*Project 3 (597 only)*

  - [Proposal](cm/cm3301_project-3_start.md)
  - [Feedback response](cm/cm1015_feedback-response.md)
  - [Meeting the week-6 goals](cm/cm3302_project-3_meet-week-6-goals.md)

## r and rstudio things

  - [Install R and RStudio](cm/cm1001_install-R-RStudio.md). If you
    already use R and RStudio, please update R, RStudio, and packages to
    the most recent versions.
  - [Create a stand-alone package library](cm/cm1003_library.md)
  - [Create the .Renviron file](cm/cm1007_Renviron.md)

## r markdown things

  - Starting with R Markdown \[[S](slides/cm4003_rmarkdown.pdf)\]  
  - [References and citations](cm/cm5011_references.md)
    \[[S](slides/cm4004_references-word-styles.pdf)\]
  - [Controlling Word
    styles](http://rmarkdown.rstudio.com/articles_docx.html)
  - [Page breaks in Rmd/docx](cm/cm5012_page-breaks.md)
  - [Centering figures and captions](cm/cm5013_centering-figs.md)
  - [Numbering figures and tables](cm/cm5014_captioner.md)

## reading for discussion

  - R1: [What does research reproducibility
    mean?](resources/readings/2016-Goodman-et-al-what-does-RR-mean.pdf)  
  - R2: [Shining light onto black
    boxes](resources/readings/2012-Morin-Shining-light-into-black-boxes.pdf)  
  - R3: [Ten simple rules for reproducible computational
    research](resources/readings/2013-Sandve-et-al-Ten-simple-rules.pdf)  
  - R4: [Reproducible research can still be
    wrong](resources/readings/2015-Leek-Peng-RR-can-still-be-wrong.pdf)  
  - R5: [Reproducible research: a dissenting
    opinion](resources/readings/2012-Drummond-RR-dissenting-opinion.pdf)

*Optional reading*

  - [Why you shouldn’t use Markdown for
    documentation](http://ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/)  
  - [Good enough practices for scientific
    computing](http://swcarpentry.github.io/good-enough-practices-in-scientific-computing/)
  - [Facilitating reproducibility in scientific computing: Principles
    and practice](http://web.stanford.edu/~vcs/papers/reprod2014.pdf)
  - [What computational scientists need to know about intellectual
    property law: A primer](https://osf.io/yi8k2/)
  - [Everybody makes mistakes (from Statistics Done
    Wrong)](resources/readings/Reinhart2015-Ch10-Everybody-makes-mistakes.pdf)
  - [A guide to enhancing reproducibility in scientific results and
    writing](http://ropensci.github.io/reproducibility-guide/)
  - [Five concrete reasons your students should be learning to analyze
    data in the reproducible
    paradigm](http://chance.amstat.org/2014/09/reproducible-paradigm/)
  - [Initial steps towards reproducible
    research](http://kbroman.org/steps2rr/)
  - [Disseminating reproducible research is fundamentally a language and
    communication
    problem](http://simplystatistics.org/2016/05/13/reproducible-research-language/)
  - [De-weaponizing
    reproducibility](http://simplystatistics.org/2015/03/13/de-weaponizing-reproducibility/)
  - [The real reason reproducible research is
    important](http://simplystatistics.org/2014/06/06/the-real-reason-reproducible-research-is-important/)
  - [Top 10 readings in
    reproducibility](https://hackernoon.com/barba-group-reproducibility-syllabus-e3757ee635cf#.8jzbyn33h)

## about

  - [My data visualization
    course](https://github.com/DSR-RHIT/me447-visualizing-data)
  - [My data display blog](http://www.graphdoctor.com)
  - [My music
blog](http://www.richardlaytonmusic.com)

<!-- #################################################### -->

<!-- ## reading -->

<!-- *week 0* -->

<!-- - [Calibration report](resources/readings/calibration-report.pdf) in class  -->

<!-- - Preface, pp. ix--xxv.  ([1.1--1.8 online](http://r4ds.had.co.nz/introduction.html))  -->

<!-- - R Markdown, pp. 423--426. ([27.1 &  27.2 online](http://r4ds.had.co.nz/r-markdown.html))  -->

<!-- *Tips* -->

<!-- - If you Google for help, avoid out-of-date advice by setting the Google Tools > Anytime > Past year  -->

<!-- - When installing R and RStudio for the first time, make sure you login as an administrator (localmgr on Windows)   -->

<!-- - Follow the instructions slowly and deliberately  -->

<!-- *Project assignments* -->

<!-- - [Project 3 getting started](cm/cm7301_project-3_start.md) ME 597 students only -->

<!-- ## week 1 -->

<!-- *Project assignments* -->

<!-- - [Project 1 getting started](cm/cm7101_project-1_start.md)  -->

<!-- ## week 2 -->

<!-- ## week 3 -->

<!-- ## week 4 -->

<!-- *Course management* -->

<!-- *Reading assigments* -->

<!-- *File management* -->

<!-- *Data* -->

<!-- *Analysis* -->

<!-- *Graphs* -->

<!-- *Tutorials* -->

<!-- *Project assignments* -->

<!-- *Reporting* -->

<!-- *Lecture slides* -->

<!-- ## week 1 -->

<!-- Reading: Chapters 2 & 3 and *Having Git ignore files* (p.99).   -->

<!-- - [Three principles of reproducibility](slides/slides003_start-report.pdf) [slides]   -->

<!-- File management  -->

<!-- - [Having Git ignore files](cm/cm008_project-1_gitignore.md)  -->

<!-- Project 1 tutorials  -->

<!-- - [Project 1 overview](cm/cm004_project-1_overview.md)  -->

<!-- - [Initialize the project](cm/cm005_project-1_initialize.md)  -->

<!-- - [Download resource and data files](cm/cm006_project-1_downloads.md)  -->

<!-- - [Start your first script](cm/cm007_project-1_first-script.md)  -->

<!-- - [Explore the data](cm/cm009_project-1_explore-data.md)  -->

<!-- - [Tidy the data](cm/cm010_project-1_tidy-data.md)  -->

<!-- ## week 2 -->

<!-- Reading: Section 11.2  -->

<!-- Project 1 tutorials  -->

<!-- - [Visually check the data](cm/cm011_project-1_graph-first-look.md)  -->

<!-- - [Perform a linear regression](cm/cm012_project-1_regression.md)  -->

<!-- - [Create the calibration graph](cm/cm013_project-1_graph-better.md)  -->

<!-- - [Write the client report](cm/cm015_project-1_report.md)  -->

<!-- - [When the data change](cm/cm017_project-1_data-change.md)  -->

<!-- - [Adding references to a report](cm/cm018_project-1_references.md)  -->

<!-- - [Project 1: Wrap-up](cm/cm049_project-1_wrapup.md)  -->

<!-- Optional   -->

<!-- - [Graph extras](cm/cm014_project-1_graph-extras.md)  -->

<!-- - [Preparing a report for transmittal](cm/cm016_project-1_report-transmittal.md)  -->

<!-- ## week 3 -->

<!-- Reading: Sections 6.2 and 6.3  -->

<!-- Tutorials  -->

<!-- - [Getting data into R](cm/cm020_getting-data-into-R.md)  -->

<!-- - [Reshaping data from wide to long form](cm/cm021_reshaping-data.md)  -->

<!-- - [Visual interpretation of the gather function](slides/slides004_visual-gather.pdf)  [slides]  -->

<!-- Project  -->

<!-- - [Initialize project 2](cm/cm019_project-2_start.md)  -->

<!-- ## week 4  -->

<!-- Reading: Chapter 7  -->

<!-- Tutorials  -->

<!-- - [Review of tools for preparing data](cm/cm022_review-data-prep.md)  -->

<!-- - [Start a new "practiceR" project](cm/cm023_practiceR.md)  -->

<!-- - [practiceR: Get a handle on your data (7.1.1)](cm/cm024_ch07_handle-on-data.md)  -->

<!-- - [practiceR: Reshaping data (7.1.2)](cm/cm025_ch07_reshaping-data.md)  -->

<!-- - [practiceR: More data prep skills (7.1.3, 4, 6, 7)](cm/cm026_ch07_more-data-prep.md)  -->

<!-- - [practiceR: Subsetting (7.1.5)](cm/cm028_ch07_subsetting.md)  -->

<!-- Project  -->

<!-- - [Project 2 collaboration assignment](cm/cm027_project-2_reviewers.md)  -->

<!-- ## week 5  -->

<!-- Reading: Sections 5.3 and 5.4  -->

<!-- Project  -->

<!-- - [GitHub: Collaborating](cm/cm029_collaborating-github.md)  -->

<!-- - [GitHub: Managing changes and conflicts](cm/cm030_change-conflict-revert.md)  -->

<!-- - [Comprehensive checklist for reproducibility](http://ropensci.github.io/reproducibility-guide/sections/checklist/)  -->

<!-- ## week 6  -->

<!-- Reading: Sections 4.1, 4.2, and 4.3     -->

<!-- Tutorials  -->

<!-- - [Graph tour overview](cm/cm034_graph-tour-overview.md)   -->

<!-- - [practiceR: Dot plot](cm/cm035_dot-plot.md)  -->

<!-- - [practiceR: Introduction to factors](cm/cm032_factors.md)  -->

<!-- - [practiceR: Working with factors](cm/cm033_working-with-factors.md)  -->

<!-- File management   -->

<!-- - [Deleting unnecessary files](cm/cm037_unlink-files.md)  -->

<!-- Project  -->

<!-- - [Project 2: Wrap-up](cm/cm040_project-2_wrapup.md)  -->

<!-- - [Project 3: Abstracts.](cm/cm031_project-3-descriptions.md)  -->

<!-- - [Project 3: Getting started](cm/cm037_project-3_collabs.md) -->

<!-- ## week 7  -->

<!-- Reading: Sections 9.1, 9.2.2, and 9.3.1     -->

<!-- Reading for class discussion: [Naming things](https://rawgit.com/Reproducible-Science-Curriculum/rr-organization1/master/organization-01-slides.html#1) (a slide presentation) and Hadley Wickham's [Style guide](http://adv-r.had.co.nz/Style.html) -->

<!-- Tutorials  -->

<!-- - [practiceR: Histogram](cm/cm036_histogram.md)  -->

<!-- - [practiceR: Line graph](cm/cm045_line-graph.md)  -->

<!-- Reporting  -->

<!-- - [Controlling Word styles](cm/cm041_word-styles.md)  -->

<!-- File management  -->

<!-- - [Fixing the .Rproj won't launch problem](cm/cm043_rstudio_Rproj-not-open.md)  -->

<!-- - [Preventable version control conflicts](cm/cm044_preventable-vc-conflicts.md)  -->

<!-- ## week 8  -->

<!-- Reading: Sections 10.1.2, 10.2, and 10.4     -->

<!-- Tutorials  -->

<!-- - [practiceR: Scatterplot](cm/cm046_scatterplot.md)  -->

<!-- - [practiceR: Data grouping](cm/cm047_data-grouping.md)  -->

<!-- - [practiceR: Data joining](cm/cm048_data-joining.md)  -->

<!-- ## week 9  -->

<!-- Reading: Sections 13.1 and 13.2     -->

<!-- Reporting  -->

<!-- - [practiceR: Numbering tables and figures](cm/cm050_Rmd-to-docx_table-numbers.md)  -->

<!-- File management -->

<!-- - [Run all scripts in sequence](cm/cm051_run-all-scripts.md)  -->

<!-- ## week 10  -->

<!-- Reading for class discussion:   -->

<!-- - [Project 3 wrapup](cm/cm052_project-3_wrapup.md)  -->

<!-- # Index -->

<!-- ## course mangement -->

<!-- - [Three principles of reproducibility](../slides/slides003_start-report.pdf) [slides]  -->

<!-- - [Comprehensive checklist for reproducibility](http://ropensci.github.io/reproducibility-guide/sections/checklist/)  -->

<!-- ## file management -->

<!-- - [Git: Ignore files](cm008_project-1_gitignore.md)  -->

<!-- - [GitHub: Collaborating](cm029_collaborating-github.md)  -->

<!-- - [GitHub: Managing changes and conflicts](cm030_change-conflict-revert.md)  -->

<!-- - [Deleting unnecessary files](cm037_unlink-files.md)  -->

<!-- - [Fixing the .Rproj won't launch problem](cm043_rstudio_Rproj-not-open.md)  -->

<!-- - [Preventable version control conflicts](cm044_preventable-vc-conflicts.md)  -->

<!-- - [Run all scripts in sequence](cm051_run-all-scripts.md)  -->

<!-- ## practice  -->

<!-- *Introduction*  -->

<!-- *Analysis*  -->

<!-- - [Perform a linear regression](cm012_project-1_regression.md) (Project 1)  -->

<!-- *Data* -->

<!-- - [Review of tools for preparing data](cm022_review-data-prep.md)  -->

<!-- - [Getting data into R](cm020_getting-data-into-R.md)  -->

<!-- - [Download resource and data files](cm006_project-1_downloads.md) (Project 1)  -->

<!-- - [Explore the data](cm009_project-1_explore-data.md) (Project 1)  -->

<!-- - [Reshaping data from wide to long form](cm021_reshaping-data.md)  -->

<!-- - [Visual interpretation of the gather function](../slides/slides004_visual-gather.pdf)  [slides]  -->

<!-- - [Tidy the data](cm010_project-1_tidy-data.md) (Project 1)  -->

<!-- Tutorials -->

<!-- - [Start a new "practiceR" project](cm023_practiceR.md)   -->

<!-- - [practiceR: Get a handle on your data (7.1.1)](cm024_ch07_handle-on-data.md)  -->

<!-- - [practiceR: Reshaping data (7.1.2)](cm025_ch07_reshaping-data.md)  -->

<!-- - [practiceR: More data prep skills (7.1.3, 4, 6, 7)](cm026_ch07_more-data-prep.md)  -->

<!-- - [practiceR: Subsetting (7.1.5)](cm028_ch07_subsetting.md)  -->

<!-- - [practiceR: Introduction to factors](cm032_factors.md)  -->

<!-- - [practiceR: Working with factors](cm033_working-with-factors.md)  -->

<!-- - [practiceR: Data grouping](cm047_data-grouping.md)  -->

<!-- - [practiceR: Data joining](cm048_data-joining.md)  -->

<!-- *Graphs*  -->

<!-- - [Visually check the data](cm011_project-1_graph-first-look.md) (Project 1)  -->

<!-- - [Create the calibration graph](cm013_project-1_graph-better.md) (Project 1)  -->

<!-- - [Graph extras](cm014_project-1_graph-extras.md) (Project 1)  -->

<!-- Tutorials  -->

<!-- - [Graph tour overview](cm034_graph-tour-overview.md)  -->

<!-- - [practiceR: Dot plot](cm035_dot-plot.md)  -->

<!-- - [practiceR: Histogram](cm036_histogram.md)  -->

<!-- - [practiceR: Line graph](cm045_line-graph.md)  -->

<!-- - [practiceR: Scatterplot](cm046_scatterplot.md)  -->

<!-- *Reporting* -->

<!-- - [Write the client report](cm015_project-1_report.md) (Project 1)  -->

<!-- - [When the data change](cm017_project-1_data-change.md)  (Project 1)  -->

<!-- - [Adding references to a report](cm018_project-1_references.md) (Project 1)  -->

<!-- - [Preparing a report for transmittal](cm016_project-1_report-transmittal.md) (Project 1)  -->

<!-- - [Controlling Word styles](cm041_word-styles.md)  -->

<!-- - [Numbering tables and figures](cm050_Rmd-to-docx_table-numbers.md)  -->

<!-- ## reading -->

<!-- ## projects  -->

<!-- *Project 1* -->

<!-- ## project assignments -->

<!-- - [Schedule of projects](cm002a_deadlines.md)  -->

<!-- old Project 1 -->

<!-- - [Overview](cm004_project-1_overview.md)  -->

<!-- - [Initialize](cm005_project-1_initialize.md)  -->

<!-- - [Start your first script](cm007_project-1_first-script.md)  -->

<!-- - [Wrap-up](cm049_project-1_wrapup.md)  -->

<!-- - [Initialize](cm019_project-2_start.md)  -->

<!-- - [Collaboration assignment](cm027_project-2_reviewers.md)  -->

<!-- - [Wrap-up](cm040_project-2_wrapup.md)  -->

<!-- *Project 2* -->

<!-- - [Abstracts](cm031_project-3-descriptions.md)  -->

<!-- - [Getting started](cm037_project-3_collabs.md)  -->

<!-- - [Project 3 wrapup](cm052_project-3_wrapup.md)  -->

<!-- *Project 3 (597 only)* -->

<!-- ## reading  -->

<!-- *Samples*  -->

<!-- - [Calibration report](resources/readings/calibration-report.pdf)  -->

<!-- Gandrud C (2015) *Reproducible Research with R and RStudio*, CRC Press.  -->

<!-- - Chapter 1  -->

<!-- - Chapters 2 & 3 and *Having Git ignore files* (p.99)  -->

<!-- - Sections 4.1, 4.2, and 4.3  -->

<!-- - Sections 5.3 and 5.4  -->

<!-- - Sections 6.2 and 6.3  -->

<!-- - Chapter 7  -->

<!-- - Sections 9.1, 9.2.2, and 9.3.1  -->

<!-- - Sections 10.1.2, 10.2, and 10.4  -->

<!-- - Section 11.2  -->

<!-- - Sections 13.1 and 13.2  -->
