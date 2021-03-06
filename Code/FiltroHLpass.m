%---------------------------------------------------------%
%--Basic High pass and Low pass filter--------------------%
%---------------------------------------------------------%
clc
close all
clear all
RGB=imread('IC 2421.png');
I=rgb2gray(RGB); % convert the image to grey 
A = fft2(double(I)); % compute FFT of the grey image
Y=fftshift(A); % frequency scaling
 
[M N]=size(A); % image size
D=2; % filter size parameter 
% defining a typical low pass filter response H(f)
% Low pass filter has value=1  in the 
% low frequency region and value=0 in the high freq
% region
Lo(1:M,1:N)=0;
Lo(0.5*M-D:0.5*M+D,0.5*N-D:0.5*N+D)=1;
% defining a typical high pass filter response H(f)
% High pass filter has value=1 in
% the high frequency region and value=0 in the low
% frequency region
Hi(1:M,1:N)=1;
Hi(0.5*M-D:0.5*M+D,0.5*N-D:0.5*N+D)=0;
% Filtered image=filter response*fft(original image)
J=Y.*Lo;
J1=ifftshift(J);
B1=ifft2(J1);
K=Y.*Hi;
K1=ifftshift(K);
B2=ifft2(K1);
%----visualizing the results----------------------------------------------
figure(1)
imshow(I);colormap gray
title('original image','fontsize',14)
figure(2)
imshow(abs(fftshift(A)),[-12 700000]), colormap gray
title('fft of original image','fontsize',14)
figure(3)
imshow(abs(B1),[12 290]), colormap gray
title('low pass filtered image','fontsize',14)
figure(4)
imshow(abs(B2),[12 290]), colormap gray
title('High pass filtered image','fontsize',14)
figure(5)
imshow(Lo,[0 1])
title('Rectangular LPF H(f)','fontsize',14)
   
figure(6)
imshow(Hi,[0 1])
title('Rectangular LPF H(f)','fontsize',14)
%-------------------------------------------------------------------------