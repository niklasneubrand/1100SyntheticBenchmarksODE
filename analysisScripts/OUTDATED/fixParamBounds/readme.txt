All parameter bounds have been updated successfully.

Now, the parameter bounds in the modle.def and the save ar struct "CcompiledProject" are based on the original template bounds.
They are extended by 10% of the overall range(lb,ub) if the randomized parmater lays outside the original bound.

Note: after finishing everything, I realized that this 10% increase has the risk of still violating the bounds.
But this is very unlikely, because we add the 10% margin the the parameter value not the bound.