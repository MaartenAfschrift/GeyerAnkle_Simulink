%% Expand path

addpath('Functions/MuscleDynamics');
addpath('Functions/MuscleGeometry');
addpath('Functions/MuscleProperties');
addpath('Functions/Reflexes');

%% Load databus
load('QualisysDataBus');

%% Run WE2 init
WE2_library_init;
