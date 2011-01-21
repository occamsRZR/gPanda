gPanda README
================
This repo contains the gPanda website and documentation.  A temporary github pages can be found at [http://occamsrzr.github.com/gPanda](http://occamsrzr.github.com/gPanda).

About
------------------------------------------------

gPanda (pronounced "pan - duh"; the 'g' is silent) started with the intent of creating an easy way to use bioinformatic software that is commonly used on the command line. The user can submit jobs and view the results instead of writing legacy scripts and storing them in directories with esoteric nomenclature.

Working locally
------------------------------------------------

You can grab the source from github:

    $ git clone git://github.com:occamsRZR/gPanda.git

The dependencies are listed in the Gemfile, you can install using bundler
  
    $ bundle install 

In order to test this, you'll first need to migrate the database:

    $ rake db:migrate

You can also populate the database with fake data:

    $ rake db:populate

When the database is set up, you may launch a local version of gPanda:

    $ rake server

You will then be able to view the site at [http://localhost:3000](http://localhost:3000). The port can be changed using the "-p" switch when calling rake server.


Hold up, WTF is up with the name?
------------------------------------------------

Fantastic question.  The name has little meaning aside from it referring to a cute animal native to China.  During much of my research, I would submit jobs to [TORQUE's](http://en.wikipedia.org/wiki/TORQUE_Resource_Manager) queue.  I would have to come up with ways to describe which batch files were which.  Long story short: to me, gPanda means __G__ __P__roteins __AND__ __A__ll.  

A simple google search also shows there are very few results for "gpanda" so this is just good SEO, IMHO. 

(whoops: there seems to be a sourceforge project named GPanda.  It's a GUI engine for linux yet has no files in the project.  Luckily, it is a GPL project)

Objective
------------------------------------------------

At the time of this commit, gPanda is an empty shell.  It really can't do anything besides display a bunch of fake data I've loaded into it.  The aim of the project is the ability to submit a custom job, the job will then be queued into TORQUE grid engine.  The logic behind submitting a job is to build a string that will be able to run a perl/python/ruby script on bioservx.

Example using my [SVM script](https://github.com/occamsRZR/svm_proteins):

    $ perl svm.pl --pos_infile=infile_pos --neg_infile=infile_neg --outfile=outfile --gamma=8 --tradeoff=8

Instead of looking at the manpage or --help printout for this program, all the options available will be shown right at the browser.  And instead of remembering what directory your data was stored, the results from this program will be stored in a database (currently at bioservweb mysql).

From these results, you can choose to do further analysis (multiple sequence alignments, reciprocal BLAST or phylogenetic analysis).  The ultimate goal is to connect a bunch of these jobs (or neurons, in this context) together and form a simple neural network.  Extrapolating this further, you will be able to start with a collection of data and neurons (jobs) and a genetic algorithm will be able to evolve, or learn different strategies to optimizing the mining process for any given group of proteins.


Wow, that's impressive. Can this also tie my shoes?
------------------------------------------------

Not yet.  I have yet to get the Tie::Shoes perl module to work ;).


Contributing
------------------------------------------------

You can contribute to this project by [forking](https://github.com/guides/fork-a-project-and-submit-your-modifications) it.

At the moment, the focus has been on using support vector machines ([SVM](http://en.wikipedia.org/wiki/Support_vector_machine)). Although the following are soon to be added:

*   HMMer (hiddgen markov model program)
*   MEME (motif finder)
*   BLAST (basic local alignment search tool)
*   MAFFT (multiple sequence alignment)
*   PhyML (phylogeny program using maximum-likelihood)
*   BioRuby (Ruby modules for bioinformatics)
*   [jsPhyloSVG](http://www.jsphylosvg.com/) (a javascript library to create interactive phylogenetic trees)

