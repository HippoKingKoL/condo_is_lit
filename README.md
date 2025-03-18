# condo

## Installation:

```
git checkout HippoKingKoL/condo_is_lit
```

## Description:
This is a simple command line interface for the Leprecondo in KoLMafia.
- If given no arguments, it prints your current condo furniture installed.
- It given a comma separated list of furniture, it installs it if there's exactly 4.
- If given "discovered" as an argument, it prints your current available furniture.
- If given "todo" as an argument, it prints the furniture you haven't found yet, and where to go.

## Example:
```
> condo help

condo run options:
    condo - print current configuration
    condo [sim] furn1,furn2,furn3,furn4 - set and print new configuration. With sim, print only.
    condo discovered - print discovered furniture.
    condo todo - print furniture left to find and locations.
    condo help - print this message.
```

![Status](/condo_status.PNG)
![Sim](/condo_sim.PNG)
![ToDo](/todo.PNG)

