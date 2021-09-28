function [gainsSol,gainsTib] = CreateGainVectors(Soleus,Tibialis)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

gainsSol = zeros(4,1);
gainsSol(1) = Soleus.e0;
gainsSol(2) =Soleus.G;
gainsSol(3) =Soleus.COM;
gainsSol(4) =Soleus.COMd;


%% Tibialis anterior
gainsTib = zeros(5,1);
gainsTib(1) = Tibialis.e0;
gainsTib(2) = Tibialis.G;
gainsTib(3) =Tibialis.loff;
gainsTib(4) =Tibialis.GSol;
gainsTib(5) =Tibialis.COM;
gainsTib(6) =Tibialis.COMd;
end

