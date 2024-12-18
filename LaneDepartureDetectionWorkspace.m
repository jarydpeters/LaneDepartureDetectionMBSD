% conversion factors
milesPerHourToMetersPerSecondConversionFactor = 0.44704;
degreesToRadiansConversionFactor = 0.0174533;
footToMeterConversionFactor = 0.3048;
meterToMillimeterConversionFactor = 1000;


%given values
seventyMilesPerHour = 70;
tenDegrees = 20;
thirtyDegrees = 30;
typicalCarWheelbaseInFeet = 9.5;
widthOfLaneInFeet = 12;
typicalCarTrackWidthInFeet = 5;
minRadiusInFeetOfInterstateCurveTakenAtSeventyMilesPerHour = 3000;
periodOfSineWaveInSeconds = 10;
steeringFrequencySmoothingCutoffInRadiansPerSecond = 0.5;

heightOfCenterOfGravityInMeters = 0.1;
springStiffnessInNewtonMetersPerMeter = 30000;
springDampingInNewtonMeterSecondsPerMeter = 2000;
massOfVehicleInKilograms = 1500;


% convert chosen values to computable/plottable values
seventyMilesPerHourInMetersPerSecond = seventyMilesPerHour * milesPerHourToMetersPerSecondConversionFactor;

tenDegreesInRadians = tenDegrees * degreesToRadiansConversionFactor;
thirtyDegreesInRadians = thirtyDegrees * degreesToRadiansConversionFactor;

typicalCarWheelbaseInMeters = typicalCarWheelbaseInFeet * footToMeterConversionFactor;
typicalCarTrackWidthInMeters = typicalCarTrackWidthInFeet * footToMeterConversionFactor;

widthOfLaneInMeters = widthOfLaneInFeet * footToMeterConversionFactor;
distanceFromCenterlineToEdgeOfLaneInMeters = widthOfLaneInMeters / 2;

minRadiusInMetersOfInterstateCurveTakenAtSeventyMilesPerHour = minRadiusInFeetOfInterstateCurveTakenAtSeventyMilesPerHour * footToMeterConversionFactor;

wavelengthOfSineWaveInMeters = periodOfSineWaveInSeconds * seventyMilesPerHourInMetersPerSecond;


%calculate maximum curvature of interstate
curvatureOfInterstate = 1 / minRadiusInMetersOfInterstateCurveTakenAtSeventyMilesPerHour;


%calculate sine wave amplitude that matches curvature of interstate
AmplitudeOfSineWaveThatMatchesMaxCurvatureOfInterstate = ((wavelengthOfSineWaveInMeters^2 * curvatureOfInterstate) / (4 * pi^2));


%calculate equation of half circle with curvature of interstate and lined
%up with sine wave for visual comparison

% calculate y value of circle's center
center_y = -(minRadiusInMetersOfInterstateCurveTakenAtSeventyMilesPerHour - AmplitudeOfSineWaveThatMatchesMaxCurvatureOfInterstate);       % Vertical position of the circle's center

%calculate x value of circle's center
center_x = wavelengthOfSineWaveInMeters / 4;

% Define xRange range by creating 1000 points between 
% -wavelengthOfSineWaveInMeters and wavelengthOfSineWaveInMeters
xRange = linspace(-wavelengthOfSineWaveInMeters, wavelengthOfSineWaveInMeters, 1000);  

% Sine wave equation
sinWaveEquation = AmplitudeOfSineWaveThatMatchesMaxCurvatureOfInterstate * sin(2 * pi * xRange / wavelengthOfSineWaveInMeters);

% Circle equation (for upper half of the circle)
circleEquation = sqrt(minRadiusInMetersOfInterstateCurveTakenAtSeventyMilesPerHour^2 - xRange.^2) + center_y;

% Plotting
figure;
hold on;
plot(xRange, sinWaveEquation, 'b-', 'LineWidth', 2);  % Plot the sine wave in blue
plot((xRange + center_x), circleEquation, 'r--', 'LineWidth', 2);  % Plot the upper half of the circle in red (dashed)

% Labels and title
xlabel('xRange (meters)');
ylabel('y (meters)');
title('Comparison of calculated Sine Wave and maximum allowable curvature of interstate at 70mph');
legend('Path of Highway', 'Maximum Allowable Curve of Highway at 70mph');
axis equal;  % Set equal scaling for both axes to preserve the shape
grid on;

% Zooming in on the region of interest
ylim([-50 20]); 
xlim([-100 wavelengthOfSineWaveInMeters])

hold off;
