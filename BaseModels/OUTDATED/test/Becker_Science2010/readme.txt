This is a modified version of the original Becker model to create a template
for out realistic simulation (RS) framework. The modifications are:

*   The Michaelis-Menten model for the receptor binding had to be removed.
    RS can only process a single "model" per project.
*   The parameters for generating the RS are based on the original Becker model, i.e.,
    a joint fit of the ODEs and Michaelis-Menten model.