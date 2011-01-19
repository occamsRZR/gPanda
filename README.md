gPanda README
================
This repo contains the gPanda website and documentation.  A temporary github pages can be found at [http://occamsrzr.github.com/gPanda](http://occamsrzr.github.com/gPanda).

Working locally
------------------------------------------------

You can grab the source from github:

    $ git clone git@github.com:occamsRZR/gPanda.git

The dependencies are listed in the Gemfile, you can install using bundler
  
    $ bundle install 

In order to test this, you'll first need to migrate the database:

    $ rake db:migrate

You can also populate the database with fake data:

    $ rake db:populate

When the database is set up, you may launch a local version of gPanda:

    $ rake server

You will then be able to view the site at [http://localhost:3000](http://localhost:3000). The port can be changed using the "-p" switch when calling rake server.

About
------------------------------------------------

gPanda (pronounced "pan - duh"; the 'g' is silent) started as an easy way to use bioinformatic software that is commonly used on the command line. The user can submit jobs and view the results instead of writing legacy scripts and storing them in directories with esoteric nomenclature.

Hold up, WTF is up with the name?
------------------------------------------------

Fantastic question.  The name has little meaning aside from it referring to a cute animal native to China.  During much of my research, I would submit jobs to [TORQUE's](http://en.wikipedia.org/wiki/TORQUE_Resource_Manager) queue.  I would have to come up with ways to describe which batch files were which.  Long story short: gPanda means "*g* *p*roteins *and* *a*ll".


Contributing
------------------------------------------------

You can contribute to this project by [forking](https://github.com/guides/fork-a-project-and-submit-your-modifications) it.

