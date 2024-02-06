%% Basic Parameter:

    Model.Name = "B6_Buck";
    Schaltfrequenz = 20e3;                                                      %Switchingfrequency in Hz
    Deadtime=500e-9;                                                            %Switch Deadtime in seconds
   
%% Grid

    Netz.R1 = 1e-3;                                                             %Reihenwiderstand vom Netz
    Netz.R2 = 1e-3;                                                             %Reihenwiderstand zu den Filterkondensatoren
    Netz.L1 = 0;                                                                %Reiheninduktivität des Netzes
    Netz.C1 = 0;                                                                %Kondensator 1. Filter                                                      
    Netz.SpannungLL = 617*1.1;                                                    % Gridvoltage Line-to-Line in V
    Netz.SpannungPeak = Netz.SpannungLL /sqrt(3)*sqrt(2);
    Netz.Frequenz = 50;                                                         % Gridfrequency in Hz
    Phaseshift=30;                                                              % in Degree (no negative possible!)

%% RC Values
    B6_Boost.C3 = 25e-6;                                                        % Intermediate Capacitor
    B6_Boost.C2 = 0.001;                                                        % Output Capacitor
    R_Capacitor=1e-4;                                                           % Capacitor internal resistance
    L_in=136e-6;                                                                % L1 3 Phase Line Inductance for PFC
    L_Buck=136e-6;                                                              % L2 Buck Inductance
    
%% Electrolyseur

    Elektrolyseur.Spannung = 670;                                               % Voltage in V
    Elektrolyseur.Leistung = 200e3*cos(Phaseshift*pi/180);                  % Electrolyseur Power
    Elektrolyseur.Strom = Elektrolyseur.Leistung/Elektrolyseur.Spannung;    %Electrolyseur Current
    Elektrolyseur.R1 = Elektrolyseur.Spannung / Elektrolyseur.Strom ;            % Electrolyseur Resistance in Ohm


%% Thermal
    T_Initial_Delta=0;                                                         %Initial Temperature Delta
    T_TIM=0;                                                                    %thermal resistance of the interface material between case and heat sink, in K/W
    T_Heatsink=80;  


%% Semiconductor
R_DS_ON_Transistor = 1e-3;
BodyDiodeForwardVoltage=3;
R_Bodydiode=1e-3;
T_Rgon=3.6;
T_Rgoff=1;



