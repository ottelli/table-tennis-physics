function solverFunction(x0,y0,z0,strikeVelocity,strikeAngle,AngVel,TableSize)
%x,y,z are initial position, strike velocity, strike angle is elevation and
%azimuth angle of launch, angvel is spin in x,y,z axis
Tf = 0;
for n=1:1:3

    %% ball flight
t = 0:0.001:3;
if n == 1
   Ball =  [x0 strikeVelocity*cosd(strikeAngle(1))*cosd(strikeAngle(2)) y0 strikeVelocity*cosd(strikeAngle(1))*sind(strikeAngle(2)) z0 strikeVelocity*sind(strikeAngle(1))];

end

options = odeset('RelTol',1e-6,'AbsTol',[1e-9 1e-9 1e-9 1e-9 1e-9 1e-9]);
[t,Bounce] = ode45(@(t,y)projectileMotion(t,y,AngVel),t,Ball(end,:),options);


%% Table Size and bouncing
i = find(Bounce(:,5)<0.76,1);

if TableSize == 0
    if Bounce(i,1) > 0 && Bounce(i,1)< 2.74 && Bounce(i,3) >0 && Bounce(i,3) < 1.525
        Bounce = Bounce(1:i,1:6);
    else 
        i = find(Bounce(:,5)<0,1);
        Bounce = Bounce(1:i,1:6);
    end
    
else
    
if TableSize == 1
    if Bounce(i,1) > 0 && Bounce(i,1)< 6 && Bounce(i,3) >0 && Bounce(i,3) < 3
        Bounce = Bounce(1:i,1:6);
    else 
        i = find(Bounce(:,5)<0,1);
        Bounce = Bounce(1:i,1:6);
    end
end
end


    %% ball bounce

    
Ball = [Ball;Bounce];

Ball(end+1,:) = projectileImpact(Ball(end,:),AngVel);

%% output calculations


% t = t+Tf(end);
Tf = [Tf;(t(1:i,:)+Tf(end))];


end % end of loop


%% plot the data

figure('outerposition',[100 100 600 600])
grid on

daspect([1 1 1])
xlabel('x-direction')
ylabel('y-direction')
zlabel('z-direction')

h = animatedline;

if TableSize == 0
    title('REGULAR TABLE')
    %table
    patch([0 2.74 2.74 0],[0 0 1.525 1.525],[0.76 0.76 0.76 0.76],'g')
    %net
    patch([1.37 1.37 1.37 1.37],[0 0 1.525 1.525],[0.76 0.9125 0.9125 0.76],'k')
    axis([-2 4.74, -2 3.525, 0 2.5])
  else 
    if TableSize == 1
        title('BIG TABLE')
        %table
        patch([0 6 6 0],[0 0 3 3],[0.76 0.76 0.76 0.76],'g')
        %net
        patch([3 3 3 3],[0 0 3 3],[0.76 1.065 1.065 0.76],'k')
        axis([-2 8, -2 5, 0 2.5])
    end
end

pause(0.75)
timeCheck = 0;
for i = 1:length(Ball)
    addpoints(h,Ball(i,1),Ball(i,3),Ball(i,5));
    
    drawnow limitrate
    pause(0.0001)
    if TableSize == 0
        if Ball(i,1) > 1.36 && Ball(i,1) < 1.38 && Ball(i,3) < 1.525 && Ball(i,3) > 0 && Ball(i,5) < 0.9125
            text(0, -2, 2,'NET','FontSize',28,'FontWeight','bold','Color','r')
            break
        end
        if Ball(i,1)>2.74 && timeCheck == 0
            text(Ball(i,1),Ball(i,3),Ball(i,5)+1,sprintf('Time to reach edge of table is %sseconds \n Velocity at edge of table is %sm/s',num2str(Tf(i)),num2str(sqrt((Ball(i,2)^2)+(Ball(i,4)^2)+(Ball(i,6)^2)))))
            timeCheck = 1;
        end
    end
    if TableSize == 1
        if Ball(i,1) > 2.99 && Ball(i,1) < 3.01 && Ball(i,3) < 3 && Ball(i,3) > 0 && Ball(i,5) < 1.065
            text(0, -2, 2,'NET','FontSize',28,'FontWeight','bold','Color','r')
            break
        end
        
        if Ball(i,1)>6 && timeCheck == 0
            text(Ball(i,1),Ball(i,3),Ball(i,5)+1,sprintf('Time to reach edge of table is %sseconds \n Velocity at edge of table is %sm/s',num2str(Tf(i)),num2str(sqrt((Ball(i,2)^2)+(Ball(i,4)^2)+(Ball(i,6)^2)))))
            timeCheck = 1;
        end
    end
end
