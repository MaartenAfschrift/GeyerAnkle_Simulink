function [Soleus,Tib,params] = LoadMuscleProperties()
%LoadMuscleProperties Muscle properties of the Soleus 
% and Tibialis anterior muscle

% Soleus muscle
Soleus.Fiso = 7000;
Soleus.lmOpt = 0.06;
Soleus.lTslack = 0.2490;
Soleus.PennationAngle = 0.4363;
Soleus.vOpt = 10;

% Tibialis anterior
Tib.Fiso = 1500;
Tib.lmOpt = 0.0972;
Tib.lTslack = 0.2011;
Tib.PennationAngle = 0.0873;
Tib.vOpt = 10;

% matrix with parameters
params = [Soleus.Fiso Tib.Fiso; 
    Soleus.lmOpt Tib.lmOpt; 
    Soleus.lTslack Tib.lTslack;
    Soleus.PennationAngle Tib.PennationAngle;
    Soleus.vOpt Tib.vOpt];
    



end

