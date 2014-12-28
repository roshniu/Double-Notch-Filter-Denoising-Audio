% Create complex plane grid
[R,I] = meshgrid(-2:.02:2, -2:.02:2 );
% Convert to z (complex number)
z = R + i*I;
 z1=0.8605+0.509i
     z2=0.8605-0.509i
     z3=0.6001+0.7999i
     z4=0.6001-0.7999i

    
     p1=0.48+0.68i
     p2=0.48-0.68i
     p3=0.72+0.36i
     p4=0.72-0.36i
G = ( (1-p1)*(1-p2)*(1-p3)*(1-p4) ) / ( (1-z1)*(1-z2)*(1-z3)*(1-z4) ) 
H = G*( (z-z1)*(z-z2)*(z-z3)*(z-z4) ) / ( (z-p1)*(z-p2)*(z-p3)*(z-p4 )
H
% Find magnitude
H_mag = abs(H);
% Clip magnitude to make better plot
H_mag( H_mag > 20 ) = 20;
% Now add unit circle to plot
theta = [0:1:359];
real_circle = cosd(theta);
im_circle = sind(theta);
z_circle = real_circle + i*im_circle;
H_circle = G*( (z_circle-z1)*(z_circle-z2)*(z_circle-z3 )*(z_circle-z4) / ( (z_circle-p1)*(z_circle-p2)*(z_circle-p3)*(z_circle-p4) );
%% Z surface
figure
surfl( R, I, H_mag );
colormap(gray)
shading interp
xlabel('Real')
ylabel('Imaginary')
zlabel('|H(z)|')
alpha(.8)
view(53,62)
axis( [-2,2,-2,2,0,10] )
hold on
plot3( real_circle, im_circle, abs(H_circle), 'r-', ...
    real_circle, im_circle, zeros(length(real_circle)), 'b-',...
    real_circle(k), im_circle(k), abs(H_circle(k)), 'ro' );
hold off
figure
for k = 1 : 4 :  length(real_circle)
    
subplot(211)
surfl( R, I, H_mag );
    colormap(gray)
shading interp
xlabel('Real')
ylabel('Imaginary')
zlabel('|H(z)|')
alpha(.8)
view(53,62)
axis( [-2,2,-2,2,0,10] )
    
hold on
plot3( real_circle, im_circle, abs(H_circle), 'r-', ...
        real_circle, im_circle, zeros(length(real_circle)), 'b-',...
        real_circle(k), im_circle(k), abs(H_circle(k)), 'ro' );
    hold off
subplot(212)
plot( pi*theta/180,  abs(H_circle), 'r-', pi*theta(k)/180,  abs(H_circle(k)), 'ro');
    xlabel('\omega (rads/sample)')
    ylabel('|H(\omega)|')
    title('Frequency Response')
text( 1,3,sprintf('omega=%2.2f rads/sample',pi*theta(k)/180) );
    drawnow
end










