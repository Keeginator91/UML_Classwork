Id_15 = [0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0];
Id_18 = [0, .005, .005, .005, .005, .005, .005, .005, .005, .005, .006];
Id_21 = [0, .168, .200, .210, .215, .218, .220, .222, .224, .225, .226];
Id_24 = [0, .737, 1.43, 2.80, 2.90, 2.90, 3.00, 3.00, 3.10, 3.20, 3.30];
Vgs   = [0.  0.1,  0.2,  0.3,  0.4,  0.5,  0.6,  0.7,  0.8,  0.9,  1.0];

figure
hold on
plot(Vgs, Id_15, 'r' )
plot(Vgs, Id_18, 'b' )
plot(Vgs, Id_21, 'g')
plot(Vgs, Id_24, 'black')
legend('Vgs = 1.5v', 'Vgs = 1.8v', 'Vgs = 2.1v', 'Vgs = 2.4v');
xlabel('Vdrain-souce (V)');
ylabel('Idrain (mA)');
title('2N7000 n-channel, enhancment MOSTFET, Vds vs. Id');