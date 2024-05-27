# This is a journal to keep track of progress and notes

## [5/22/2024 - 11:32 AM]:
I've created my first MOOSE application and successfully ran a simulation.
My next goal is to find some sort of project to work on to further learn moose. 
I think I'll accomplish this by looking for some sort of time dependant model, possibly heat conduction.

## Goal #1: Model diffusion of a material.
### Project Statement:
This goal will be to model the diffusion of heat from the center of a metal plate.

This metal plate will be $10\times 10\times .25$ in inches.
The center of the material will be heated to a point of 500 F.

### Challenges:
#### [5/22/2024 - 1:32 PM]
Viewing the output file in Paraview does not seem to be working.

Possible causes:
* Input file is not correct
* Using Paraview incorrectly
* The GeneratedMesh I used does not render in paraview correctly

Solution:
For some reason, Paraview does not render the GeneratedMesh specified in the input file. Instead, Peacock seems to work just fine.

#### [5/27/2024 - 4:32 PM]
Trying to use ICs with SmoothCircleIC does not seem to work. 
It throws the following error: "A 'SmoothCircleIC' is not a registered object."

Using BoundingBoxIC does run correctly, but does not seem to work as intended when viewing in peacock.

Resorting to using a bottom boundary condition for now. . .

## Goal #2: Model diffusion of a material over time.
### Project Statement:
This goal will be to model the diffusion of heat from the bottom of the plate over a time step.

This metal plate will be $10\times 10\times .25$ in inches.
The center of the material will be heated to a point of 500 F.

