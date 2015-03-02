%% Limpieza

clear all
close all
clc

%% Prueba Imágenes Híbridas

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
imwrite(final,'MyImages/Prueba_HybridImage.png')

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

%Guardar Imagen Resultante
print ('-dpng','MyImages/Prueba_HybridImageSteps.png');

%Mostrar la pirámide
figure(2)
subplot(2,3,1), subimage(final)
axis([0 400 0 350])
title('Pyramid Level 1 (100%)', 'FontWeight', 'bold')
subplot(2,3,2), subimage(imresize(final,0.75))
axis([0 400 0 350])
title('Pyramid Level 2 (75%)', 'FontWeight', 'bold')
subplot(2,3,3), subimage(imresize(final,0.5))
axis([0 400 0 350])
title('Pyramid Level 3 (50%)', 'FontWeight', 'bold')
subplot(2,3,4), subimage(imresize(final,0.3))
axis([0 400 0 350])
title('Pyramid Level 4 (30%)', 'FontWeight', 'bold')
subplot(2,3,5), subimage(imresize(final,0.2))
axis([0 400 0 350])
title('Pyramid Level 5 (20%)', 'FontWeight', 'bold')
subplot(2,3,6), subimage(imresize(final,0.1))
axis([0 400 0 350])
title('Pyramid Level 6 (10%)', 'FontWeight', 'bold')

%Guardar la pirámide
print ('-dpng','MyImages/Prueba_HybridImagePyramid.png');