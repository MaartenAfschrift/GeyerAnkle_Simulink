function [lMT,dM,vMT] = GetMuscleGeometry_LengthOnly(q)
% GetMuscleGeometry is a function that uses polynomials to evaluate the muscle-tendon
% lengths, velocities and  moment arms as a function of the joint angles and velocities.
% Inputs:
%   - q: vector with joint angles
% Outputs:
%   - lMT: muscle-tendon length
%   - dM: moment arm
%   - vMT: muscle-tendon velocity

lMT = [0; 0];
dM  = [0; 0];
vMT = [0; 0];


% load offline info
cTib = [0.3010;   -0.0455;   -0.0043;    0.0042];
cSol = [0.2901;    0.0449;   -0.0074;   -0.0066];


lMT(2) = cTib(1) +  cTib(2).*q + cTib(3).*q^2 + cTib(4).*q^3;
dM(2) = - (cTib(2) + 2*cTib(3).*q + 3*cTib(4).*q^2);

lMT(1) = cSol(1) +  cSol(2).*q + cSol(3).*q^2 + cSol(4).*q^3;
dM(1) = - (cSol(2) + 2*cSol(3).*q + 3*cSol(4).*q^2);



end

