function drawrose2_R
grid on
[x,t]=meshgrid((0:24)./24,(0:0.5:575)./575.*20.*pi-4*pi);
p=(pi/2)*exp(-t./(8*pi));
change=sin(20*t)/150;
u=1-(1-mod(3.3*t,2*pi)./pi).^4./2+change;
y=2*(x.^2-x).^2.*sin(p);

r=u.*(x.*sin(p)+y.*cos(p)).*1.5;
h=u.*(x.*cos(p)-y.*sin(p));

map=[0.5300    0.8300    0.8100
    0.5200    0.7500    0.8200
    0.4900    0.6200    0.8400
    0.4900    0.5600    0.8400
    0.4700    0.4900    0.8500
    0.4500    0.3500    0.8700
    0.9500    0.9500    0.9500];
Xi=1:size(map,1);Xq=linspace(1,size(map,1),100);
map=[interp1(Xi,map(:,1),Xq,'linear')',...
     interp1(Xi,map(:,2),Xq,'linear')',...
     interp1(Xi,map(:,3),Xq,'linear')'];

set(gca,'CameraPosition',[2 2 2])
hold on
Xset=r.*cos(t);Yset=r.*sin(t);
sf=surface(Xset,Yset,h,'EdgeAlpha',0.1,...
    'EdgeColor',[0.5 0.5 0.5],'FaceColor','interp');
colormap(map)


theta=0;
while 1
    theta=theta+0.02;
    set(sf,'XData',Xset.*cos(theta)-Yset.*sin(theta),...
        'YData',Xset.*sin(theta)+Yset.*cos(theta))
    pause(0.01)
end

end