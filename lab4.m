clear all;
close all;

Ts=0.1;

L=[1];
M=[1 3 3 1];

L1=[1];
M1=[1 1];

L2=[1];
M2=[1 2 2 1];


K=tf(L,M);
Kz=c2d(K,Ts,'foh');

K1=tf(L1,M1);
Kz1=c2d(K1,Ts,'foh');

K2=tf(L2,M2);
Kz2=c2d(K2,Ts,'foh');


%%%%%reg. PI%%%%%
I=1;
for P = 1.0:0.5:3.0
sim('schemat',30)

figure(1);
hold on;
grid on;

plot(ans.tout, ans.x3);
end
xlabel("Czas");
ylabel("Wartości");
title('Regulator typu PI')


%%%%%%zad1%%%%%%%
sim('schemat',30)
figure(2);
hold on;
grid on;

plot(ans.tout, ans.x);
xlabel("Czas");
ylabel("Wartości");
title('Transmitancja 1')

figure(3);
hold on;
grid on;

plot(ans.tout, ans.x1);
xlabel("Czas");
ylabel("Wartości");
title('Transmitancja 2')

figure(4);
hold on;
grid on;

plot(ans.tout, ans.x2);
xlabel("Czas");
ylabel("Wartości");
title('Transmitancja 3')





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%minimalizacja kryterium

P = 6;
I = 2;

figure(5);
hold on;
grid on;

for i = 0.01:0.01:0.8
Ts = i;
sim('schemat2');
plot(Ts, ans.Q(end), '.');
end

title('Minimalizacja kryterium');
xlabel('Ts');
ylabel('Q(P,I)');