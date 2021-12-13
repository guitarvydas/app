# applications


# tools
- pfr
- pf
- querydisplay3
- setquerydisplay
- pre
- d2f
- das2j
- examples
	- rnot
- intermediate forms
	- querydisplay
	- querydisplay2
	- das2f
- build
	- makedocker


# usage
- put ${HOME}/bin/bin on your PATH
- typically, I create a run.bash file in each app directory to show how to use the tool
- use `./make.bash` to create a Docker image and `run.bash` to run a bash shell in the image (an environment in which all tools are available)


# Tool Documentation
- pfr [[pfr]]
- pf [[pf]]
- querydisplay3 [[querydisplay3]]
- setquerydisplay [[setquerydisplay]]
- pre [[pre]]
- d2f [[d2f]]
- das2j [[README]]
- examples
	- rnot [rnot]]
- intermediate forms
	- querydisplay [[querydisplay]]
	- querydisplay2 [[querydisplay2]]
	- das2f [[das2f]]
- build
	- makedocker [[makedocker]]
- INSTALL [[install]]
- make.bash [[make]]
# structure

${HOME}/app
	bin
	pfr
	node_modules
	pfr
	querydisplay3
	setquerydisplay
	pre
	d2f
	das2f
	das2j
	rnot
	makedocker

- bin - contains tools, put this on your $PATH
- pfr - Parsing Find Replace tool
- node_modules - used by *node* ; *npm* modules installed here
- querydisplay3 - tool
- setquerydisplay - similar to querydisplay, except based on PROLOG sets (see das2j/run.bash --> layer6)
- pre - pfr applied to incoming text chunks fenced by regexps
- d2f - .drawio to factbase (.drawio == diagrams.net) (raw conversion from .drawio to factbase)
- das2f - diagram to factabase (different from d2f in that das2f "parses" the diagram as a language)
- das2j - diagram to JSON (converts das2f factbase format to JSON format)
- rnot - an example datalog-like notation, and, an example of live-editing a pfr program
- makedocker - creates a docker image that contains all of the tools
- 
## Files
- README.md
- INSTALL.md
- make.bash

- bin - is where all script roots are found ("bin" used to mean "binary", I use "bin" to mean a "bin" (container thing))

- makedocker - a Dockerfile and run.bash for creating the full app environment

- pfr - parsing find replace tool

---
