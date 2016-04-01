close all
clear all
%% Step1: convert to gray scale & resize
im = imread('3.jpg');
im = imresize(im,[512,512]);
im = rgb2gray(im);
imshow(im);
%% Step2: add noise & display
img = imnoise(im,'gaussian',0,10/255);
imsp = imnoise(im,'salt & pepper',0.1);
subplot(2,2,1),imshow(im),title('Original Image')
subplot(2,2,2),imshow(img),title('Gaussian')
subplot(2,2,3),imshow(imsp),title('Salt & Pepper')
%% gauss filter
figure()
gaussk = fspecial('gaussian', [9 9],1);
gauss_outputg = my_Gauss_filter(img,gaussk);
gauss_outputsp = my_Gauss_filter(imsp,gaussk);2

subplot(1,2,1),imshow(gauss_outputg),title('Gaussian Noise')
subplot(1,2,2),imshow(gauss_outputsp),title('SP Noise')

Gauss_SNRg1 = 20*log ( norm(double(im),'fro') /norm(double(im) - double(img), 'fro' )) 
Gauss_SNRg2 = 20*log ( norm(double(im),'fro') /norm(double(im) - double(gauss_outputg), 'fro' ))
Gauss_SNRsp1 = 20*log ( norm(double(im),'fro') /norm(double(im) - double(imsp), 'fro' ))
Gauss_SNRsp2 = 20*log ( norm(double(im),'fro') /norm(double(im) - double(gauss_outputsp), 'fro' ))

%% median filter
figure()
median_outputg = my_Median_filter(img);
median_outputsp = my_Median_filter(imsp);
subplot(2,2,1),imshow(median_outputg),title('Gaussian Noise with My Median Filter')
subplot(2,2,2),imshow(median_outputsp),title('SP Noise with My Median Filter')
builtin_outputg = medfilt2(img,[3 3]);
builtin_outputsp = medfilt2(imsp, [3 3]);
subplot(2,2,3),imshow(builtin_outputg) ,title('Gaussian Noise with built-in filter')
subplot(2,2,4),imshow(builtin_outputsp) ,title('SP Noise with built-in filter')

Median_SNRg = 20*log ( norm(double(im),'fro') /norm(double(im) - double(median_outputg), 'fro' )) 
Median_SNRsp = 20*log ( norm(double(im),'fro') /norm(double(im) - double(median_outputsp), 'fro' ))
Builtin_SNRg = 20*log ( norm(double(im),'fro') /norm(double(im) - double(builtin_outputg), 'fro' )) 
Builtin_SNRsp = 20*log ( norm(double(im),'fro') /norm(double(im) - double(builtin_outputsp), 'fro' ))

%% edge detector
figure()
output = Sobel_edgeDetector(im);
subplot(1,2,1),imshow(output),title('Result with my edge detector');
subplot(1,2,2),imshow(edge(im,'Sobel')),title('Result with built-in edge detector');

