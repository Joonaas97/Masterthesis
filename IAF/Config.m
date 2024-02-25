clear;
%%Name
Model.Name = "IAF_model";
IAF.Schaltfrequenz = 20e3;
IAF.Deadtime = 500e-9; %
Phaseshift = -0;                   %Phasenverschiebung

%% Grid
Netz.Frequenz = 50;                 %Hz
Netz.SpannungLL = 617;              %Volt
Netz.SpannungPeak = Netz.SpannungLL /sqrt(3)*sqrt(2);
Netz.R1 = 1e-3;                     %Reihenwiderstand von Netz
Netz.R2 = 50;                       %Reihenwiderstand zu den Filterkondensatoren


%% Electrolyseur
Elektrolyseur.Spannung = 680;   
Elektrolyseur.Leistung = 200e3*cos(Phaseshift*pi/180);
Elektrolyseur.Strom = Elektrolyseur.Leistung/Elektrolyseur.Spannung;
Elektrolyseur.R1 = Elektrolyseur.Spannung / Elektrolyseur.Strom;


%% Thermal
HeatSinkTemperatur = 80;            %Kühlplattentemperatur
InitialTemperaturDelta = 0;

%% Die schnellen Schalter
T_RgOn = 3.6;
T_RgOff = 1;
T_TIM = 0;
T_Ron=1e-3;
T_Vf=3;

%% Input Voltage Selector
IVS_RgOn = 3.6;
IVS_RgOff = 1;
IVS_TIM = 0;

%% Dioden Gleichrichter
D_TIM = 0;
D_Ron=1e-3;
D_Vf=1;

%% Buck
T_Buck_RgOn = 3.6;
T_Buck_RgOff = 1;
T_Buck_TIM = 0;
IAF.DCDC.Schaltfrequenz = 20e3;
IAF.Reglerfrequenz = 50e3;
IAF.L2 = 136e-6;

%% Netzeingang
IAF.C1 = 50e-6;
IAF.L1 = 1e-6;  %Netz
IAF.C2 = 1e-3;  %Electrolyseur
IAF.C3 = 5e-5;  %Zwischenkreis
IAF.R1 = 1e-3;   %Kondensator Innenwiderstand

IAF.Stromregler.SampleTime = 1/100000;


%%Induktivität des IVS
IAF.L3 = 302.2e-6; 

