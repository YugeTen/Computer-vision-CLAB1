close all
clear all
im = imread('urban.jpg');
%% filter 1 (low pass filter)
kernel1 = [1 ,1,1; 1,1,1; 1,1,1]*1/9 ;
output1 = my_filter(im,kernel1);
%% filter 2 (band pass filter)
kernel2 =  [1,1,1; 0,0,0 ; -1,-1,-1]  ;
output2 = my_filter(im,kernel2);
%% filter 3 (high pass filter)
kernel3 =   [ 0,-1, 0; -1 , 8, -1; 0,-1,0]   ;
output3 = my_filter(im,kernel3);
%% display
subplot(3,3,1),imshow(output1),title('Image through Filter 1');
subplot(3,3,4),imshow(output2),title('Image through Filter 2');
subplot(3,3,7),imshow(output3),title('Image through Filter 3');
%% fft
fftA = fft2(double(output1));
fftB = fft2(double(output2));
fftC = fft2(double(output3));
subplot(3,3,2), imshow(abs(fftshift(fftA)),[0 100000])
title('Image through Filter 1 FFT2 Magnitude')
subplot(3,3,5), imshow(abs(fftshift(fftB)),[0 100000])
title('Image through Filter 2 FFT2 Magnitude')
subplot(3,3,8), imshow(abs(fftshift(fftC)),[0 100000])
title('Image through Filter 3 FFT2 Magnitude')

output1_fft = ifft2(fftA);
Amin = min(min(abs(output1_fft)));
Amax = max(max(abs(output1_fft)));
subplot(3,3,3), imshow(abs(output1_fft),[Amin Amax])
title('Recovered Image through Filter 1 Using IFFT')

output2_fft = ifft2(fftB);
Bmin = min(min(abs(output2_fft)));
Bmax = max(max(abs(output2_fft)));
subplot(3,3,6), imshow(abs(output2_fft),[Bmin Bmax])
title('Recovered Image through Filter 2 Using IFFT')

output3_fft = ifft2(fftC);
Cmin = min(min(abs(output3_fft)));
Cmax = max(max(abs(output3_fft)));
subplot(3,3,9), imshow(abs(output3_fft),[Cmin Cmax])
title('Recovered Image through Filter 3 Using IFFT')




