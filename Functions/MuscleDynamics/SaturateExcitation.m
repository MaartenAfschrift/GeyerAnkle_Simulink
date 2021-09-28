function [eout] = SaturateExcitation(e,b)
%SaturateExcitation Limits the excitations between zero and 1
%   Smooth version (tanh) mainly used for gradient based optimization



e1      = e.*(tanh(b*e)*0.5+0.5);
e2      = (e1-1).*(tanh(b*(e1-1))*0.5+0.5);
eout    = e1-e2;


end

