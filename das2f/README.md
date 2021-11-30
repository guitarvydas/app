Tranpsiler DaS diagram into a factbase.

WIP

current workflow (attempting to replace layer3 with generated, multi-language code produced from layer3.md)
layer3 creates "das_fact(contains..." relationships
1. ./dev.bash
2. ./dev00.bash


current dev workflow:
1. ./dev.bash
2. ./dev0.bash

or, concurrent:
1. ./dev.bash
2. ./dev1.bash
3. ./dev2.bash




- a Decide what the drawing symbols mean (see DaS.md).
- b Draw the diagram helloworld.drawio (using draw.io for now).

- facts after a&b : see FACTS.md

- 1. Convert the diagram to factbase format using the `d2f` tool.
