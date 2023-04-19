function outbound = projectileImpact(inbound,AngVel)
% calculates the rebound velocities of a ball after hitting a surface with
% 'inbound' properties




%% initial conditions
% y(1) = x (progression) displacement
% y(2) = x (progression) velocity
% y(3) = y (lateral) displacement
% y(4) = y (lateral) velocity
% y(5) = z (vertical) displacement
% y(6) = z (vertical) velocity
% y(7) = pitching spin (x)
% y(8) = yawing spin (y)
% y(9) = rolling spin (z)

Radius = 0.01985;
Vres = sqrt((inbound(2)^2 + inbound(4)^2));
Ores = sqrt((AngVel(2)^2 + AngVel(1)^2));
CoFx = 0.0017 * (inbound(2) + Radius*AngVel(3)) + 0.1635; % value from regression model in Inaba 2017 for a celluloid ball
CoFy = 0.0017 * (inbound(4) + Radius*AngVel(1)) + 0.1635; % value from regression model in Inaba 2017 for a celluloid ball
CoFz = 0.0017 * (Vres + Radius*Ores) + 0.1635; % value from regression model in Inaba 2017 for a celluloid ball
CoR = 0.92; %fixed value from Miyazaki 2017 and upper bound of ITTF rules 
%CoFx = 0.4;
% CoFy = 0.4;
% CoFz = 0.4;

% CoR = -0.0096 * inbound(6) + 1.0418; % value from regression model in Inaba 2017 for a celluloid ball
ksqw = (2/5)*(Radius^2);
A = ksqw/(Radius^2);


        %% x axis (progression)
outbound(1) = inbound(1); % x displacement

slippingX = inbound(2)+(CoFx*inbound(6))*(1 + CoR);
if AngVel(1) < 0 
rollingX = (inbound(2)-((A*AngVel(3)*Radius)))/(1+A);
else
    rollingX = (inbound(2)-((A*AngVel(3)*Radius))/10)/(1+A);
end

    if slippingX>rollingX
    outbound(2) = slippingX; % x velocity
        else
            outbound(2) = rollingX; % x velocity
            
    end
    
        %% y axis (lateral)
outbound(3) = inbound(3); % y displacement

slippingY = inbound(4)+(CoFy*inbound(6))*(1+CoR);
if AngVel(1) < 0 
rollingY = (inbound(4)-((A*AngVel(1)*Radius))/10)/(1+A);
else
    rollingY = (inbound(4)-(A*AngVel(1)*Radius))/(1+A);
end
    if slippingY>rollingY
    outbound(4) = slippingY; % y velocity
    
        else
            outbound(4) = rollingY; % x velocity
            
    end
    
    
        %% z axis (vertical)

    if inbound(5) > 0.5
    outbound(5) = 0.76; % z displacement
    else
        outbound(5) = 0;
    end
    
outbound(6) = -CoR*inbound(6); % z velocity



end