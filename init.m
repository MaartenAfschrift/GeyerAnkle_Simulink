%% Expand path

% add the exoskeleton libraries
% wr_Library = 'C:\Users\Maarten\Documents\GeyerAnkle\wr-actuator-library';
wr_Library = fullfile(pwd,'wr-actuator-library');
addpath(genpath(wr_Library));

% add functions for the simulink model
addpath('Functions/MuscleDynamics');
addpath('Functions/MuscleGeometry');
addpath('Functions/MuscleProperties');
addpath('Functions/Misc');
addpath('Functions/Reflexes');


%% Load databus
QualisysDataBus_struct.M1x = double(0);
QualisysDataBus_struct.M1y = double(0);
QualisysDataBus_struct.M1z = double(0);
QualisysDataBus_struct.M2x = double(0);
QualisysDataBus_struct.M2y = double(0);
QualisysDataBus_struct.M2z = double(0);
QualisysDataBus_struct.M3x = double(0);
QualisysDataBus_struct.M3y = double(0);
QualisysDataBus_struct.M3z = double(0);

QualisysDataBus = struct2bus(QualisysDataBus_struct, 'QualisysDataBus');
clear QualisysDataBus_struct;

%% Run WE2 init
run(fullfile(wr_Library,'WE2_library_init.m'));
