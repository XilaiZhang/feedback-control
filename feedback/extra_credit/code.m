c1=load('hope.mat')
Time=c1.ans(1,:)
amplitude=c1.ans(2,:)
%for windowSize=[1 5 10 50 100]
windowSize = 1000; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
y = filter(b,a,amplitude);
[val, idx] = max(y);
%TF = islocalmax(y);
%plot(Time,y,Time(TF),y(TF),'r*')
plot(Time,y,Time(idx),y(idx),'r*')
ysource=1+idx/(2000*40);
ysource=floor(ysource);

sum=0;
start=(ysource-1)*40+10;
for i=[start]% 80 120 160 200]
    for j=i*2000:10:i*2000+2000*5
        sum=sum+y(j)^2
    end
end
p1=sum/1000;

sum2=0;
start2=(ysource+2)*40+10;
for k=[start2]% 80 120 160 200]
    for l=k*2000:10:k*2000+2000*5
        sum2=sum2+y(l)^2
    end
end
p2=sum2/1000;

ratio=p1/p2;

xsource= 3/(tan(acos(sqrt(1/ratio))));
xsource=floor(xsource);
disp(['The estimated value of ysource is ' int2str(ysource)]);
disp(['The ysource value fed into the sensor module is ' int2str(4)]);
disp(['The estimated value of xsource is ' int2str(xsource)]);
disp(['The xsource value fed into the sensor module is x_source+x_drone, which is 2+1=3']);