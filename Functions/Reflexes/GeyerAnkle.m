function [e] = GeyerAnkle(GRFy, Gains, FSol, lMTib, COMd, BodyMass)
%GeyerAnkle Geyer reflexes with feedback of COM kinematics
%   inputs:
%       (1) GRFy: vertical ground reaction forces [N]
%       (2) Gains: matlab structure with gains for Soleus and Tibialis
%       (3) FSol: Normalised Soleus force []
%       (4) lMTib: normalized fiber length of the tibialis anterior []
%       (5) COMd: deviation in COM velocit w.r.t. normal walking  [m/s]
%       (6) BodyMass: Mass of test subject [kg]


% threshold for event detection
GRF_threshold = 50;

% detect if leg is in stance or swing phase
GRFy = abs(GRFy);
BoolStance = false;
if GRFy>GRF_threshold
   BoolStance = true; 
end

% Smooth transition between in and out of contact
GRF_Norm = GRFy./(BodyMass*9.81);
GRF_Norm  = 0.5*tanh(10*(GRF_Norm-0.4))+0.5;


%% Soleus reflex
Soleus = Gains.Soleus;
if BoolStance
    ForceFB =  Soleus.G.*FSol.*GRF_Norm;
    COMFB = Soleus.COMd .* COMd;
    eSol = ForceFB + COMFB;
else
    eSol = 0;
end

%% Tibialis reflex

Tib = Gains.Tibialis;
LengthFB =  Tib.G.*(lMTib - Tib.loff) - Tib.GSol .* FSol;
COMFB = Tib.COMd .* COMd;
if BoolStance    
    eTib = Tib.e0 + LengthFB + COMFB;
else
    eTib = Tib.e0 + LengthFB;
end

%% Output reflexes

% feedback excitations
e = [eSol; eTib];
% sature between 0 and 1
e = SaturateExcitation(e,15);
% add basline excitation
e = e + [Soleus.e0; Tib.e0];




end

