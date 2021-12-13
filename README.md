applications

structure:

${HOME}/app/bin
${HOME}/app/pfr
${HOME}/app/node_modules
${HOME}/app/pfr
${HOME}/app/querydisplay3
${HOME}/app/setquerydisplay
${HOME}/app/pre
${HOME}/app/d2f
${HOME}/app/das2f
${HOME}/app/das2j
${HOME}/app/rnot
${HOME}/app/makedocker

- README.md
- INSTALL.md

- bin - is where all script roots are found ("bin" used to mean "binary", I use "bin" to mean a "bin" (container thing))

- makedocker - a Dockerfile and run.bash for creating the full app environment

- pfr - parsing find replace tool

tools
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


usage:
- put ${HOME}/bin/bin on your PATH
- typically, I create a run.bash file in each app directory to show how to use the tool
- use `./make.bash` to create a Docker image and `run.bash` to run a bash shell in the image (an environment in which all tools are available)

---
