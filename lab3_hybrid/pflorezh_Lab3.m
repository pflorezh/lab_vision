%% Limpieza

clear all
close all
clc

%% Prueba

%Leer imagenes originales
image1=imread('data/dog.bmp');
image2=imread('data/cat.bmp');

%Low-pass filter
filter1=fspecial('gaussian', 30, 35);
filtered1=imfilter(image1,filter1);

%High-pass filter
filter2=fspecial('gaussian', 30, 35);
lp=imfilter(image2,filter2);
filtered2=image2-lp;

%Sum
final=filtered1+filtered2;

%Guardar Imagen Resultante
imwrite(final,'MyImages/HybridImage_Prueba.png')

%Mostrar el resultado
figure(1)
subplot(2,2,1), subimage(image1)
title('Original 1', 'FontWeight','bold')
subplot(2,2,2), subimage(image2)
title('Original 2', 'FontWeight','bold')
subplot(2,2,3), subimage(filtered1)
title('Low-Pass Filtered', 'FontWeight','bold')
subplot(2,2,4), subimage(filtered2)
title('High-Pass Filtered', 'FontWeight','bold')

%Arreglar piramide y guardar
figure(2)
suptitle('Pyramid of the Hybrid Image')
f1=subplot(2,2,1);
image(final)
f2=subplot(2,2,2);
image(imresize(final,0.5))
f3=subplot(2,2,3);
image(imresize(final,0.25))
f4=subplot(2,2,4);
image(imresize(final,0.125))
linkaxes([f1,f2,f3,f4])

%Guardar Imagen Resultante
imwrite(pyr,'MyImages/HybridImagePyramid_Prueba.png')

%% Tarea Imagenes Hibridas
