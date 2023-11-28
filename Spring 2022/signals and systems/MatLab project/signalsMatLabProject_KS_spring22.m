%%%%% KEEGAN SMITH SIGNALS AND SYSTEMS MATLAB PROJECT %%%%%%%

clear;
close all;

fc = 100;               %fc=100Hz
f0 = 200;               %f0=200Hz;
wc = 2*pi*fc;
w0 = 2*pi*f0;

dw = 0.1*pi;
fw = 400;               % The max frequency 400Hz is used for evaluation
ww = 2*pi*fw;
w = -ww:dw:ww;

dt = 0.0005;
t = 0:dt:0.2;
xt = exp(-100*t);

XW = CTFourierTransform(t, dt, xt, w); % X(jw) % Perform Fourier transform for continious-time signal

figure;
hold on;
plot( w/(2*pi) , abs(XW));  
title('|X(jw)|');
hold off;

xtr = ICTFourierTransform(w, dw, XW, t);        % Perform inverse Fourier transfrom for continuous-time signal
                                                                          
%figure;
%hold on;
%plot(t, xt, 'r');
%plot(t, real(xtr),'b');
%title('x(t)');
%legend('x(t)', 'recvd x(t)');
%hold off;

tic;

%%%%%%% STUDENT TASK BEGINS HERE %%%%%%%%
%HERE YOU NEED TO CALCULATE Y(jw) X(jw) W(jw) F(jw)

 yt = xt .* exp(1j .*wc .*t);
 Yjw = CTFourierTransform( t, dt, yt, w);   % Fourier transform of Y(jw)
 yrt = ICTFourierTransform(w, dw, Yjw, t);  % Recovered y(t) from Y(jw)

 lowpass = (w >= -w0 & w <= w0);    % lowpass filter
 Wjw = lowpass .* Yjw;
% inverse fourier transform of |W(jw)| to get w(t) then multiply that by
% e^(-1j*wc*t) to get f(t)

 wt = ICTFourierTransform( w, dw, Wjw, t); % inverse fourier of |W(jw)| for w(t) 

 ft = wt .* exp(-1j .*wc .*t);
 Fjw = CTFourierTransform(t, dt, ft, w);
 frt = ICTFourierTransform(w, dw, Fjw, t);

 figure;
 hold on
 title('Total overlay');
 plot( w/(2*pi) , abs(XW) , 'r');
 plot( w/(2*pi) , abs(Yjw) , 'g');
 plot( w/(2*pi) , abs(Wjw) , 'b');
 plot( w/(2*pi) , abs(Fjw) , 'black');
 legend('|X(jw)|', '|Y(jw)|', '|W(jw)|', '|F(jw)|');
 xlabel('Frequency Hz');
 hold off;
 
%%%%%%% STUDENT TASK  ENDS  HERE %%%%%%%%

time = toc;
fprintf('The running time is %6.4f seconds\n', time);

%%%%%%%%% FOURIER TRANSFORM %%%%%%%%%%%
function FT = CTFourierTransform(t, dt, xt, w)
    LengthW = length(w);
    FT = zeros(1, LengthW);
    for len = 1:LengthW
        wl = w(len);
        FT(len) = sum(xt .* exp(-1j*wl*t))*dt;
    end
end
%%%%%%%%%%%% INVERSE FOURIER TRANSFORM %%%%%%%%%%%%%
function xt = ICTFourierTransform(w, dw, XW, t)
    LengthT = length(t);
    xt = zeros(1,LengthT);
    for len = 1:LengthT
        tt = t(len);
        xt(len) = sum(XW .* exp(1j*w*tt))*dw/(2*pi);
    end
end