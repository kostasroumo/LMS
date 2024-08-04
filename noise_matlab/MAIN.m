% MAIN.m
clear;
clc;
%% ADD NOISE
[d,Fs]=audioread("guit1.wav");
% d=d/max(abs(d));
sigma=0.01;
noise=sigma*randn(size(d));
x=d+noise;

%sound(x,Fs);

%% PLOT & SAVE
% t = (0:length(d)-1)/Fs;
% figure;
% subplot(2, 1, 1);
% plot(t, d);
% title('Original Signal');
% subplot(2, 1, 2);
% plot(t, x);
% title('Noisy Signal');

% saveas(gcf,"Signals.png","png");


%% LMS 

mu_values=[0.1,0.5,0.7];
snr_values=zeros(3,1);

for i=1:length(mu_values)
   [filtered_signal,error,weights]=my_lms(x,d,10,mu_values(i));
   snr_values(i)=snr(d,filtered_signal);
   sound(filtered_signal,Fs);
   pause(length(filtered_signal)/Fs + 0.5); 


end 
%% NLMS
mu_values=[0.1,0.5,0.7];
snr_values=zeros(3,1);

for i=1:length(mu_values)
   [filtered_signal,error,weights]=my_nlms(x,d,20,mu_values(i));
   snr_values(i)=snr(d,filtered_signal);
%    sound(filtered_signal,Fs);
%    pause(length(filtered_signal)/Fs + 0.5); 

end 
