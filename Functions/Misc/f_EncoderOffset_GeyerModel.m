function [qOff] = f_EncoderOffset_GeyerModel(q,start,caltime_s)
%f_EncoderOffset_GeyerModel function to compute the average encoder value
%during upright standing. This is used as callibration for the geyer model.
%   Input:
%       1) q: encoder angle
%       2) start: Boolean to trigger start callibration
%       3) caltime_s: total duration callibration
%   Output: 
%       1) qOff: average encoder value during callibration period

persistent qCal calibrated nosamp
persistent counter

sf = 1000; % sampling frequency

% initialise values
if isempty(calibrated)
    calibrated = false;
    counter = 0;
    nosamp = max(1, floor(caltime_s*1000));
    qCal = 0;
end

% start a new callibration period
if start ==1
    % start the callibration
    qCal = q;
    nosamp = max(1, floor(caltime_s*sf));
    calibrated = false;
    counter = 0;
end

% callibration procedure
if(calibrated)
    qOff = qCal;
else
    % callibration is ongoing
    if ~calibrated
        counter = counter + 1;
        qCal = qCal + q./nosamp;
        if(counter >= nosamp)
            calibrated = true;
        end
    end
    qOff = 0; % temporary use zero callibration
end










end

