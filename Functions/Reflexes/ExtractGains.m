function [Gains] = ExtractGains(SolGains,TibGains)
%ExtractGains Vector with gains to a structure

%% Soleus
Soleus.e0 = SolGains(1);
Soleus.G = SolGains(2);
Soleus.COMd = SolGains(3);


%% Tibialis anterior
Tibialis.e0= TibGains(1);
Tibialis.G = TibGains(2);
Tibialis.loff = TibGains(3);
Tibialis.GSol = TibGains(4);
Tibialis.COMd = TibGains(5);

%% Add to structure
Gains.Soleus = Soleus;
Gains.Tibialis = Tibialis;
end

