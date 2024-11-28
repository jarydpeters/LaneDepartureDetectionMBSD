# LaneDepartureDetectionMBSD

This project models a bad driver on a curvy road and the vehicle's efforts to correct lane departures.

The curve of the road follows a calculation for a worst-case-scenario highway curvature at 70 miles per hour.

The lane departure assist has been tuned with a PID controller to return the driver to the lane, balancing the response between quick and gentle.

The vehicle's roll on its springs has been added as a rudimentary Simscape model to show how the vehicle rocks back and forth during the lane departure correction events.
