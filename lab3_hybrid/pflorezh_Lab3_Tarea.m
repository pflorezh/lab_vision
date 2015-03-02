%% Limpieza

clear all
close all
clc

%% Tarea Imagenes Hibridas

%Leer imagenes originales
image1=imread('MyImages/Tarea_ImgOrig02.png');
image2=imread('MyImages/Tarea_ImgOrig01.png');

%Low-pass filter
filter1=fspecial('gaussian', 50, 25);
filtered1=imfilter(image1,filter1);

%High-pass filter
filter2=fspecial('gaussian', 100, 15);
lp=imfilter(image2,filter2);
filtered2=image2-lp;

%Sum
final=filtered1+filtered2;
imwrite(final,'MyImages/Tarea_HybridImage.png')

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
print ('-dpng','MyImages/Tarea_HybridImageSteps.png');

%Mostrar la pirámide
figure(2)
subplot(2,3,1), subimage(final)
axis([0 1044 0 1080])
title('Pyramid Level 1 (100%)', 'FontWeight', 'bold')
subplot(2,3,2), subimage(imresize(final,0.75))
axis([0 1044 0 1080])
title('Pyramid Level 2 (75%)', 'FontWeight', 'bold')
subplot(2,3,3), subimage(imresize(final,0.5))
axis([0 1044 0 1080])
title('Pyramid Level 3 (50%)', 'FontWeight', 'bold')
subplot(2,3,4), subimage(imresize(final,0.3))
axis([0 1044 0 1080])
title('Pyramid Level 4 (30%)', 'FontWeight', 'bold')
subplot(2,3,5), subimage(imresize(final,0.2))
axis([0 1044 0 1080])
title('Pyramid Level 5 (20%)', 'FontWeight', 'bold')
subplot(2,3,6), subimage(imresize(final,0.1))
axis([0 1044 0 1080])
title('Pyramid Level 6 (10%)', 'FontWeight', 'bold')

%Guardar la pirámide
print ('-dpng','MyImages/Tarea_HybridImagePyramid.png');