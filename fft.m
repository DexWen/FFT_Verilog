clear;clc;clf;
N=16;
n=0:15;
xn=[3 0 8 0 1 0 3 0 1 1 0 0 0 0 0 0];
%xn=[3 0 8 0 1 0 3 0 1 1 12 0 2 0 5 2];
W=[1 1 1 1;1 -1j -1 1j;1 -1 1 -1;1 1j -1 -1j];
X1=0.*n;
for n0=0:3
    X1(n0+1)=W(1,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
    X1(n0+5)=W(2,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
    X1(n0+9)=W(3,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
    X1(n0+13)=W(4,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
end
X2=0.*n;
for n0=0:3
    X2(n0+1)=W(1,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
    cos0=exp(-1i*2*pi/N*n0)
    cos1=exp(-1i*2*pi/N*2*n0)
    cos2=exp(-1i*2*pi/N*3*n0)
    X2(n0+5)=W(2,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
    cos3=exp(-1i*2*pi/N*n0)
    cos4=exp(-1i*2*pi/N*2*n0)
    cos5=exp(-1i*2*pi/N*3*n0)
    X2(n0+9)=W(3,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
    X2(n0+13)=W(4,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
end
X=fft(xn);

figure(1);
subplot(2,2,1);stem(n,xn,'filled');
xlabel('n');ylabel('x(n)');
title('输入序列');grid on;
subplot(2,2,2);stem(n,abs(X),'filled');
xlabel('k');ylabel('abs(X(k))');
title('FFT-幅度谱');grid on;
subplot(2,2,3);stem(n,real(X),'filled');
xlabel('k');ylabel('real(X(k))');
title('FFT-频谱实部');grid on;
subplot(2,2,4);stem(n,imag(X),'filled');
xlabel('k');ylabel('imag(X(k))');
title('FFT-频谱虚部');grid on;

figure(2);
subplot(2,2,1);stem(n,abs(X2),'filled');
xlabel('k');ylabel('abs(X(k)');
title('16点基-4  幅度谱');grid on;
subplot(2,2,2);stem(n,real(X2),'filled');
xlabel('k');ylabel('real(X(k)');
title('16点基-4  频谱实部');grid on;
subplot(2,2,3);stem(n,imag(X2),'filled');
xlabel('k');ylabel('imag(X(k)');
title('16点基-4  频谱虚部');grid on;

