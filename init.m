%% Expand path

[directory, ~, ~] = fileparts(mfilename('fullpath'));

addpath(fullfile(directory, 'wr-actuator-library'));

addpath(genpath(fullfile(directory, 'Functions')));

%% Run WE2 init
WE2_library_init;
ForcePlateLopes;

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
