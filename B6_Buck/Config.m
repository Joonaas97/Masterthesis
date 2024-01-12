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
    Elektrolyseur.Leistung = 200e3*cos(Phaseshift*pi/180);                                             % Power in W
    Elektrolyseur.Spannung = 670;                                               % Voltage in V
    Elektrolyseur.Leistung = Elektrolyseur.Leistung*cos(Phaseshift*pi/180); % Electrolyseur Power
    Elektrolyseur.Strom = Elektrolyseur.Leistung/Elektrolyseur.Spannung;    %Electrolyseur Current
    Elektrolyseur.R1 = Elektrolyseur.Spannung / Elektrolyseur.Strom ;            % Electrolyseur Resistance in Ohm


%% Thermal
    T_Initial_Delta=0;                                                         %Initial Temperature Delta
    T_TIM=0;                                                                    %thermal resistance of the interface material between case and heat sink, in K/W
    T_Heatsink=100;  


%% Semiconductor
R_DS_ON_Transistor = 1e-3;
BodyDiodeForwardVoltage=3;
R_Bodydiode=1e-3;
T_Rgon=3.6;
T_Rgoff=1;



%out = sim(Model.Name,'SimulationMode','accelerator','StopTime','0.4');

%plot(out.simout(:,2:9))

%% Script
% %%
% disp('Press any key to start Simulations or press Ctrl + C to cancel')
% pause;
% 
% %% Schleifen teil
% stop = 0;
% 
% 
% Zeile = 2;
% listPower = [1 0.75 0.5 0.25];
% listVac = [600 617 700 800];
% listVdc = [400 500 600 680 700 800];
% for elmPower = listPower
%     for elmVac = listVac
%         for elmVdc = listVdc
%             if (stop == 0)
%                 plecsclear;
%                 if(exist('slprj', 'dir'))
%                     rmdir('slprj', 's');
%                 end
%                 fileNameToDelete=strcat(Model.Name,'.slxc');
%                 if(exist(fileNameToDelete, 'file'))
%                     delete(fileNameToDelete);
%                 end
% 
%                 %         if any(strcmp(A, cat(2,namePure,'.csv'))) %skip if the files got already simulated
%                 %             disp('!file already exists!')
%                 %         else
% 
% 
%                 %%% Basic Parameter
%                 Netz.Frequenz = 50; %Hz
%                 Netz.SpannungLL = elmVac; %Volt
%                 Netz.SpannungPeak = Netz.SpannungLL /sqrt(3)*sqrt(2);
%                 Netz.SpannungLN = Netz.SpannungLL/sqrt(3);
% 
%                 Elektrolyseur.Spannung = elmVdc;
%                 Elektrolyseur.Strom = 295*elmPower;
%                 Elektrolyseur.Leistung = Elektrolyseur.Strom*Elektrolyseur.Spannung;
%                 Elektrolyseur.R1 = Elektrolyseur.Spannung / Elektrolyseur.Strom;
% 
%                 try
%                     disp(cat(2,'Start of Simulation at ',datestr(now,'HH:MM:SS')))
%                     timerStart=tic;
%                     out = sim(Model.Name,'SimulationMode','accelerator','StopTime','0.4');
%                     elapsedTime=toc(timerStart);
%                     disp(cat(2,'End of Simulation at ',datestr(now,'HH:MM:SS')))
%                     disp(cat(2,'duration of simulation: ',num2str(round(elapsedTime/60,1)),' Minuten (',num2str(round(elapsedTime)),' Sekunden)'))
%                     %simData=[B.simout.time B.simout.signals.values];
%                     %csvwrite(strcat(Model.Name,'.csv'),out.simout);
%                 catch exception
%                     exception
%                     switch exception.identifier
%                         case 'Simulink:Commands:SimAborted'
%                             stop = 1;
%                         otherwise
%                             %failedFiles = [failedFiles; {name}];
%                             continue
%                     end
%                 end
%                 while ~isnan(readmatrix('test.xlsx','Range', strcat('C',num2str(Zeile),':C',num2str(Zeile)))) %such die nächst freie Zeile in dem Dokument
%                     Zeile = Zeile +1;
%                 end
%                 writematrix(out.simout, 'test.xlsx','Range',strcat('C',num2str(Zeile),':AC',num2str(Zeile)))    %Schreibt die daten in die Zeile
%                 
%             end
%         end
%     end
% end

