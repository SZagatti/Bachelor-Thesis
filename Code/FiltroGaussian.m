%---------------------------------------------------------%
%--Gaussian High pass and Low pass filter--------------------%
%---------------------------------------------------------%
clc
close all
clear all
RGB=imread('IC 1132.png');
I=rgb2gray(RGB); % convert the image to grey 
A = fft2(double(I)); % compute FFT of the grey image
A1=fftshift(A); % frequency scaling
% Gaussian Filter Response Calculation
[M N]=size(A); % image size
R=2; % filter size parameter 
X=0:N-1;
Y=0:M-1;
[X Y]=meshgrid(X,Y);
Cx=0.5*N;
Cy=0.5*M;
Lo=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
Hi=1-Lo; % High pass filter=1-low pass filter
% Filtered image=ifft(filter response*fft(original image))
J=A1.*Lo;
J1=ifftshift(J);
B1=ifft2(J1);
K=A1.*Hi;
K1=ifftshift(K);
B2=ifft2(K1);
%----visualizing the results----------------------------------------------
figure(1)
imshow(I);colormap gray
title('original image','fontsize',14)
figure(2)
imshow(abs(B2),[]), colormap gray

%-------------------------------------------------------------------------
