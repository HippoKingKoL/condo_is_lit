# condo

## Installation:

```
git checkout HippoKingKoL/condo_is_lit
```

## Description:
This is a simple command line interface for the Leprecondo in KoLMafia. It takes a comma separated list of furniture and installs it if there's exactly 4.
If given no arguments, it prints your current condo furniture installed.
If given "discovered" as an argument, it prints your current available furniture.
If given "todo" as an argument, it prints the furniture you haven't found yet, and where to go.

## Example:
```
> condo

Current condo setup:
couch and flatscreen
cupcake treadmill
programmable blender

> condo couch a,treadmill,blender,omni

Setting condo to:
couch and flatscreen
cupcake treadmill
programmable blender
Omnipot
Preference leprecondoInstalled changed from 18,9,14,0 to 18,9,14,25
Preference _leprecondoRearrangements changed from 1 to 2

> condo

Current condo setup:
couch and flatscreen
cupcake treadmill
programmable blender
Omnipot
```
