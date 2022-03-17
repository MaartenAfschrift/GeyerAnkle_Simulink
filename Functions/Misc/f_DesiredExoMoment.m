function [tau_Left, tau_Right]  = f_DesiredExoMoment(tau_Reflex, tau_ReflexUnp,...
    BodyMass, BodyLength, MaxTorque, TorqueScale,ControlType)
%f_DesiredExoMoment switched between control types and selects the desired
%exo moment for the left and right leg.
% input arguments:
%   1. tau_reflex: joint moment of reflex model with COMd feedback
%   2. tau_reflexUnp: joint moment of reflex model without COMd feedback
%   3. BodyMass: in kg
%   4. BodyLength: in m
%   5. MaxTorque: in Nm
%   6. TroqueScale: % of assistance provided with exo
%   7. ControlType: value between 0 and 3 to selected controller/
%       0: zero impedance
%       1: reflex model without COMd feedback
%       2: reflex model with COMd feedback
%       3: reflex with COMd - Reflex wihout COMd

% Scale factor based on body proportions
tau = tau_Reflex./(70*1.75).*(BodyMass*BodyLength);

% Scale factor based on body proportions
tauUnp = tau_ReflexUnp./(70*1.75).*(BodyMass*BodyLength);

tauModel = zeros(2,1);
if ControlType == 0
    tauModel = 0;
elseif ControlType ==1
    tauModel = tauUnp;
elseif ControlType == 2
    tauModel(1) = tauUnp(1);
    tauModel(2) = tau(2);
elseif ControlType == 3 
    tauModel(1) = 0;
    tauModel(2) = tau(2) - tauUnp(2);
else
    tauModel = tau;
end
    
% Unpack tau
% Scale torque based on input (0.0 - 1.0)
tau_Left = -tauModel(1) * TorqueScale;
tau_Right = -tauModel(2) * TorqueScale;

if tau_Left > MaxTorque
    tau_Left = MaxTorque;
elseif tau_Left < -MaxTorque*0.6
    tau_Left = -MaxTorque*0.6;
end

if tau_Right > MaxTorque
    tau_Right = MaxTorque;
elseif tau_Right < -MaxTorque*0.6
    tau_Right = -MaxTorque*0.6;
end
end

