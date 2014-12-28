%REMOVING AUDIO DISTURBANCE.
%Z1, Z2, Z3 , Z4 ARE THE OBTAINED ZEROS REFER THE FILTER DESIGN
% SECTION TO SEE HOW THEY ARE OBTAINED
z1=0.8605+0.509i
z2=0.8605-0.509i
z3=0.6001+0.7999i
z4=0.6001-0.7999i
% P1,P2, P3 ,P4 ARE THE OBTAINED POLES , REFER THE FILTER
% DESIGN SECTION TO
% SEE HOW THEY ARE OBTAINED
p1=0.48+0.68i
p2=0.48-0.68i
p3=0.72+0.36i
p4=0.72-0.36i
% FORMING THE DISCRETE FREQUENCY RESPONSE AND DIFFERENCE
%EQUATION USING THE
% a, b coefficients
a = poly( [p1,p2,p3,p4] )
b = poly( [z1,z2,z3,z4] )
%calculating the gain of the frequency response
G = polyval( a, 1) / polyval( b, 1 )
b=b*G;
% fvtool is used to plot the various responses, pole-zero plot, etc
fvtool(b,a)
% Loading the given phone signal
load x.mat
% playing the phone signal ( disturbed version )
sound(x,Fs)
audiowrite('inputdata.wav',x,Fs)
% Representing the x.mat phoneclip as a spectrograph using 1000 times bins
specgram(x,1000,8192)
% Setting the sampling frequency to 8192 Hz
Fs=8192
% Using the double notch filter in the phone signal to remove the unwanted
% sounds
y=filter(b,a,x)
%Playing the filtered phone clip ( after filtering the given phone signal
%with the help of the desgined double notch filter)
sound(y,Fs)
audiowrite('outputdata.wav',y,Fs)
%Representing the y ( after filtering ) as a spectrograph using 1000 times
%bins
specgram(y,1000,8192)