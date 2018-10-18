
# project 2 follow up

The following comments are also applicable to project 3 (597 students).

## treat your project as milestone documentation

The scripts you write to explain your reproduction of someone else’s
work can be considered what Zumel and Mount
([2014](#ref-zumelmount2014)) call *milestone documentation.* As they
explain, milestone documentation is a readable summary of

  - project goals  
  - data provenance  
  - steps taken  
  - technical results (numbers and graphs)

Milestone documentation

  - shows the state of a project
  - is read by collaborators and peers
  - can be concise
  - includes code
  - allows others to assess your work, i.e., check that it works, that
    you state your assumptions, explain choices you’ve made, etc.

## acquiring source data

These comments summarize the discussion we had with Ryan Weir.

1.  When searching for sources, be as specific with your search terms as
    possible.
2.  Do not spend more than an hour on one search. Stop and ask our
    research librarians for help.
3.  Rose has access to databases and other library resources of which
    you may not be aware. Ask for help.
4.  You can use (or ask help using) the Web of Science database for
    tracking down a chain of references. Ryan can help you with this
    too.

## organizing your scripts

The balance between Rmd code chunks and R scripts is up to you. Find the
balance that works for you while still meeting the overall goal of
milestone documentation and collaborator readability.

1.  The overall goal is to write scripts such that the reader can follow
    every step of your reproduction. The goal is not to write a final
    report.
2.  Thus your work can consist of several Rmd scripts, each one
    performing a particular exploration, showing intermediate results,
    commenting on them, and comparing them where possible to work from
    the source paper.
3.  You might uncover a result that is inconsistent with the source
    paper. if so, the reader should be able to follow your reasoning and
    believe that your work supports your assertion that the original
    work contains an error. This is, of course, one of the primary
    rationales for reproducing another’s work in the first place.
4.  As a consequence, you may have a lot of code embedded in code chunks
    in an Rmd script instead of having stand-alone R scripts. To reach
    our goals of making the reproduction understandable to the
    collaborator, this is OK.

## using the Q\&A script

1.  Your project repo should have a Q\&A Rmd script for your
    collaborators to markup as they attempt to reproduce your work
2.  Review and comment at least once a week in your collaborator
    (Carlos) role.
3.  To review and comment, pull the author’s latest repo and reproduce
    their work. Try to follow the logic of the author’s argument and
    comment and question everything you don’t understand. Write your
    comments and questions in the Q\&A script.
4.  In your role as author (Alice) you are expected to read the comments
    and respond to them by editing your work and summarizing your
    response in the same Q\&A document. The next time your collaborator
    reviews your work, all comments should have a response.

## references

<div id="refs" class="references">

<div id="ref-zumelmount2014">

Zumel, Nina & John Mount (2014) *Practical Data Science with R*. Manning
Publications Co.Shelter Island, NY.

</div>

</div>
