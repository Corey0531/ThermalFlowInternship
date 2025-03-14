%%要改的地方都標好了，其他沒錯誤不用動
%% 理論值
Water = 2;%L
time = 7.6;%s
%改上面兩個
Q = Water/time*0.001;%m^3/s
D1 = 13.6/1000;%m
D2 = 26.2/1000;%m
V1 = Q/((pi*D1^2)/4);%m/s
V2 = Q/((pi*D2^2)/4);%m/s
Re1 = (997*V1*D1)/(0.891*10^-3);
Re2 = (997*V2*D2)/(0.891*10^-3);
%有可能要改，這是氣溫25度的
epsilon = 1.5*10^-6;

colebrook1 = @(f) 1/sqrt(f) + 2.0 * log10((epsilon/(D1*1000))/3.7 + 2.51/(Re1 * sqrt(f)));
colebrook2 = @(f) 1/sqrt(f) + 2.0 * log10((epsilon/(D2*1000))/3.7 + 2.51/(Re2 * sqrt(f)));
f0 = 0.02;% 初始猜測值
f1 = fsolve(colebrook1, f0);%13.6的
f2 = fsolve(colebrook2, f0);%26.2的
% 定義 k 矩陣 (10x1)(A to J)
%f*L/D
hAth = f1*914.4/13.6;%這個要改
% A to J
k = [hAth;1.1; 0.9; 0.2; 0.393; 1.3; 0.23; 0.18; 0.08; 10];  %這個要改


% 常數 c
c = (V1^2*1000)/(2*9.8);  % (v^2*1000)/(2*g)
hKth = f2*914.4/26.2*(V2^2*1000)/(2*9.8);%這個要改


% 計算 h 矩陣
hth = k * c;
% 顯示結果
disp(' htheory(A to J):');
disp(hth);
disp(' htheory(K):');
disp(hKth);

%%實際值
%A to K
deltaP = [355;550;475;884;-60;240;295;110;300;1292;20];%要改

%D and J need to be multiplied by 13.6
Coefficient = [0;3373;3429;468;300;300;3485;3523;2560;525;0] ;
fVQudratic = f1*(V1^2);
hre = deltaP - Coefficient*fVQudratic;
disp(' hreal(A to K):');
disp(hre);

%D的實際值很奇怪，不確定是否有錯