This is a modified version of the original Swameye model to create a template
for out realistic simulation (RS) framework. The modifications are:

*   The original model has an input spline with 5 knots. The time-points are fixed, but the 5 amplitudes are fitted.
    This spline can diverge for times that are larger than the last time-point, which can be problematic for our RS methods.
    To avoid this, we replace the input with a 10-knot spline (there are no others (e.g. 6 knots) inplemented in d2d).
    The additional 5 knots are used to fix the spline for large times to small values. This avoids the divergence. 