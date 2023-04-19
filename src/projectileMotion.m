function dy = projectileMotion(t,y,AngVel)

% AngVel(1,2,3) = x,y,z

g = 9.81; % Acceleration due to gravity (m/s^2).
rho = 1.22; % Air density (kg/m^3).
D = 0.0394;
radius = D/2;
Area = pi*(D^2)/4; % cross sectional area
mass = 0.00251;
omega = sqrt(AngVel(1)^2 + AngVel(2)^2 + AngVel(3)^2); % angular velocity magnitude


% SRD = 0.02; % spin rate decay constant (no value found in literature)
vRES = sqrt((y(2)^2)+(y(4)^2)+(y(6)^2));

mu = 1.5111e-5; % viscosity of air at 20 degrees celcius
Re = (rho*D*(sqrt((y(2)^2)+(y(4)^2)+(y(6)^2))))/mu;
SP = (pi*D*omega)/(sqrt(y(2)^2 + y(4)^2 + y(6)^2)); % spin paramter


%% setting lift coefficient for changing Re and SP

if SP < 1.1
    if Re < 3.5*10^4
    cl = (0.4591*(SP^6))-(3.902*(SP^5))+(8.133*(SP^4))-(5.1744*(SP^3))-(0.718*(SP^2))+(1.5917*SP)-0.1035;    
    end
    if Re > 3.5*10^4 && Re < 4.5*10^4
    cl = (6.6087*(SP^6))-(28.434*(SP^5))+(44.901*(SP^4))-(31.076*(SP^3))+(8.2768*(SP^2))+(0.0387*SP)-0.0001;    
    end
    if Re > 4.5*10^4 && Re < 5.5*10^4
    cl = (9.4779*(SP^6))-(39.423*(SP^5))+(59.512*(SP^4))-(38.635*(SP^3))+(9.2325*(SP^2))+(0.1867*SP)-0.0164;    
    end
    if Re > 5.5*10^4 && Re < 6.5*10^4
    cl = (15.247*(SP^6))-(60.008*(SP^5))+(86.816*(SP^4))-(54.982*(SP^3))+(13.552*(SP^2))-(0.2742*SP)-0.0056;
    end
    if Re > 6.5*10^4 && Re < 7.5*10^4
    cl = (27.452*(SP^6))-(101.08*(SP^5))+(137*(SP^4))-(82.103*(SP^3))+(20.02*(SP^2))-(0.9323*SP)+0.0048;    
    end
    if Re > 7.5*10^4 && Re < 8.5*10^4
    cl = (48.124*(SP^6))-(160.04*(SP^5))+(194.25*(SP^4))-(102.04*(SP^3))+(20.262*(SP^2))-(0.1799*SP)-0.0546;    
    end
    if Re > 8.5*10^4
        if   SP < 0.5   
            cl = (76.075*(SP^5))-(59.861*(SP^4))+(2.997*(SP^3))+(3.9446*(SP^2))-(0.0221*SP)+0.0197;    
        else
            cl = -(15.191*(SP^5))+(76.781*(SP^4))-(148.91*(SP^3))+(137.57*(SP^2))-(59.659*SP)+9.7316;
        end
    end
 else
 cl = 0.37;
end

LiftForce = 0.5*rho*Area*cl; % with lift coefficient polynomial from miyazaki data

%% setting drag coefficient for changing Re and SP

if SP < 1.1
    if Re < 3.5*10^4
    cd = -(4.7511*(SP^6))+(16.149*(SP^5))-(18.952*(SP^4))+(8.6642*(SP^3))-(1.2113*(SP^2))+(0.1076*SP)+0.3982;    
    end
    if Re > 3.5*10^4 && Re < 4.5*10^4
    cd = -(20.551*(SP^6))+(64.893*(SP^5))-(74.007*(SP^4))+(36.596*(SP^3))-(7.5337*(SP^2))+(0.5979*SP)+0.4205;    
    end
    if Re > 4.5*10^4 && Re < 5.5*10^4
    cd = -(17.029*(SP^6))+(53*(SP^5))-(58.991*(SP^4))+(28.031*(SP^3))-(5.4193*(SP^2))+(0.4001*SP)+0.4107;    
    end
    if Re > 5.5*10^4 && Re < 6.5*10^4
    cd = -(1.923*(SP^6))+(0.235*(SP^5))+(9.7662*(SP^4))-(12.602*(SP^3))+(5.0178*(SP^2))-(0.5341*SP)+0.4441;
    end
    if Re > 6.5*10^4 && Re < 7.5*10^4
    cd = -(0.0287*(SP^6))-(6.9898*(SP^5))+(19.031*(SP^4))-(16.86*(SP^3))+(5.1893*(SP^2))-(0.3382*SP)+0.3987;
    end
    if Re > 7.5*10^4 && Re < 8.5*10^4
    cd = (17.467*(SP^6))-(64.009*(SP^5))+(87.743*(SP^4))-(54.083*(SP^3))+(13.888*(SP^2))-(1.0202*SP)+0.4115;
    end
    if Re > 8.5*10^4
    cd = (12.01*(SP^6))-(43.085*(SP^5))+(57.337*(SP^4))-(33.57*(SP^3))+(7.738*(SP^2))-(0.4498*SP)+0.3987;
    end 
  else
  cd = 0.44;
end

DragForce = -0.5*rho*Area*cd;




%% derivatives

dy = zeros(6,1); % pre-define dy for speed

dy(1) = y(2); % change in x displacement is x velocity
dy(3) = y(4); % change in y displacement is y velocity
dy(5) = y(6); % change in z displacement is z velocity


if omega==0
    dy(2) = (vRES/mass)* (DragForce*y(2));
    dy(4) = (vRES/mass)* (DragForce*y(4));
    dy(6) = (vRES/mass)* (DragForce*y(6)) -g;
else
    dy(2) = (vRES/mass)* (DragForce*y(2)+ LiftForce*(AngVel(2)*(y(6)) - AngVel(3)*(y(4)))/omega); % x
    dy(4) = (vRES/mass)* (DragForce*y(4)+ LiftForce*(AngVel(3)*(y(2)) - AngVel(1)*(y(6)))/omega); % y
    dy(6) = (vRES/mass)* (DragForce*y(6)+ LiftForce*(AngVel(1)*(y(4)) - AngVel(2)*(y(2)))/omega) - g; % z
end




end
