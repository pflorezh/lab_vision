# Introduction to Images in Matlab

## Setup

1.  Start the virtual machine
2.  Clone the original lab vision repository

    ```bash
    git clone https://github.com/diego0020/lab_vision.git lab_vision_orig
    ```
3.  Clone your fork from the repository

    ```bash
    git clone https://github.com/<USER>/lab_vision.git lab_vision
    ```
4.  Copy the folder lab2_matlab to your repository

    ```bash
    cp -rf lab_vision_orig/lab2_matlab lab_vision
    ```
5.  Delete the original repository from your machine

    ```bash
    rm -rf lab_vision_orig
    ```
6.  Commit changes to your repository

    ```bash
    cd lab_vision
    git status
    git add *
    git commit -m "added matlab lab"
    ```
7.  Push changes

    ```bash
    git push
    ```    
8.  Download and uncompress the sipi_images misc folder in your home folder

    ```bash
    cd ~
    scp -r vision@guitaca.uniandes.edu.co:/home/vision/sipi_images/misc.tar.gz .
    # alternative
    # wget http://sipi.usc.edu/database/misc.tar.gz
    tar -xzf misc.tar.gz
    ```    
9.  Open matlab

    ```bash
    /usr/local/MATLAB/R2014b/bin/matlab
    ```

Note: On windows you can use [github for windows](https://windows.github.com/) or [git-scm](http://git-scm.com/)

**IMPORTANT**
This file contains questions, you should write your answers here and don't forget to **commit** and **push** to
your github account.

## Working directory

The following commands can be used inside matlab, just like in bash

    -   pwd
    -   ls
    -   cd

For more file system see http://www.mathworks.com/help/matlab/file-operations.html

Note the current directory is also shown at the top of the graphical interface

1.  Change to the *misc* directory, which contains the uncompressed sipi_images
>> cd /home/vision/misc

2.  List the contents of the directory
>> ls
4.1.01.tiff  4.1.06.tiff  4.2.03.tiff  5.1.09.tiff  5.1.14.tiff  5.3.02.tiff  7.1.05.tiff  7.1.10.tiff	    house.tiff
4.1.02.tiff  4.1.07.tiff  4.2.04.tiff  5.1.10.tiff  5.2.08.tiff  7.1.01.tiff  7.1.06.tiff  7.2.01.tiff	    numbers.512.tiff
4.1.03.tiff  4.1.08.tiff  4.2.05.tiff  5.1.11.tiff  5.2.09.tiff  7.1.02.tiff  7.1.07.tiff  boat.512.tiff    ruler.512.tiff
4.1.04.tiff  4.2.01.tiff  4.2.06.tiff  5.1.12.tiff  5.2.10.tiff  7.1.03.tiff  7.1.08.tiff  elaine.512.tiff  testpat.1k.tiff
4.1.05.tiff  4.2.02.tiff  4.2.07.tiff  5.1.13.tiff  5.3.01.tiff  7.1.04.tiff  7.1.09.tiff  gray21.512.tiff


## Reading Images

The [imread](http://www.mathworks.com/help/matlab/ref/imread.html) command is used in matlab to read images. 

1.  Look at the manual page for the command
2.  Read the ``5.1.12`` image
    
    What is the dimension of the output?

    >   256 x 256

3.  Read the ``4.2.03`` image
    What is the dimension of the output?

    >   512 x 512 x 3

## Displaying Images

The following commands can be used for displaying images

-   [image](http://www.mathworks.com/help/matlab/ref/image.html)
-   [imshow](http://www.mathworks.com/help/images/ref/imshow.html)

1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
3.  What are the differences?

    >   With Imshow we obtain the original image as seen on the folder (a smaller size clock and a bigger size monkey), while with Image we get an interpretation of the same image with alterations regarding their RGB properties, such as the yellow color seen in the clock image.

## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg (Done with '4.2.03.tiff')
3.  Write a matlab function that takes the path of an image and converts it to jpg

    >   The function is called img2jpg.m and it's located on the folder with the resulting images. The content is:
    
    > function img2jpg( image )
        
    > i=imread(image);
    
    > [path,name,ext] = fileparts(image);
    
    > imwrite(i,[name,'.jpg']);
    
    > end
    
## Matlab and the shell

### Shell from Matlab

It is possible to excecute bash commands from matlab by using the [system](http://www.mathworks.com/help/matlab/ref/system.html) command
or by using a [bang](http://www.mathworks.com/help/matlab/matlab_env/run-external-commands-scripts-and-programs.html)

1.  Look at the manual pages
2.  Try it (for example ``!ps``)

### Matlab from the shell

It is also possible to invoke matlab in a non interactive mode to run a script from the terminal. If the matlab
binary is on the system PATH you can do something like this

```bash
matlab -nodisplay -nosplash -r "write_jpg('boat.512.tiff'); exit"
# or
matlab -nodisplay -nosplash script.m"
```
If the command or script doesn't end in ``exit`` the matlab shell will stay open, and will block the bash script.

### Exercise

1.  Create a script for converting all tiff images to jpeg
    -   You may create a bash script that calls matlab
    -   Or a matlab script that calls bash 
    -   Or both
2.  Save this script in the matlab lab folder of your git repository

  > Saved as AllTiff2Jpg.m
  
## Filters

### Adding noise

The [imnoise](http://www.mathworks.com/help/images/ref/imnoise.html) command can be used to add noise to images.
We can do this to simulate difficult capture conditions, and evaluate the algorithms over difficult situations.

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)
3.  Try saving noisy images as jpg, what happens?

    > Nothing too visible, just the added noise seems less than before changing the format.

### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html)
    and apply it with [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) 
-   To apply a median filter use the function [medfilt2](http://www.mathworks.com/help/images/ref/medfilt2.html)

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > With the median filter we obtain images that still mantain their edges, so this filter might be better to preserve the image and get rid of the salt and pepper noise.

For more on noise removal read http://www.mathworks.com/help/images/noise-removal.html

### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html).

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > The edges of the blurred image are less and less noticeable as the filter grows in size, the filter gets more destructive of the details when it's bigger.

### Sharpen

The [imsharpen](http://www.mathworks.com/help/images/ref/imsharpen.html) function lets us sharpen an image. 

1.  Sharp the ``5.1.12`` image. What do you notice?

    > The edges seem to be more noticeable. The difference between features is clearer.

2.  Sharp a blurred image. What do you notice?

    > Some of the effects of the blurring seem to disappear, however, the result isn't quite like the original image.

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Answer

More sophisticated methods for finding edges can be found in the following pages
    -   http://www.mathworks.com/discovery/edge-detection.html
    -   http://www.mathworks.com/help/images/ref/edge.html

### More

For more filtering operations look at http://www.mathworks.com/help/images/linear-filtering.html

## Color Spaces

As seen on the section on reading image, color images are represented by matrices with 4 dimensios.
The [color](http://www.mathworks.com/help/images/color.html) matlab module contains functions for moving between
color spaces.

1.  Load the ``4.2.03.tiff`` image (Mandril).
2.  Split it into the three color channels
    
    ```matlab
    img=imread('4.2.03.tiff');
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    ```
3.  Look at the three channels simultaneusly

    ```matlab
    figure;
    subplot(2,2,1), subimage(img);
    subplot(2,2,2), subimage(r);
    subplot(2,2,3), subimage(g);
    subplot(2,2,4), subimage(b);
    ```
    
4.  Save the mosaic as a png file
    
    ```matlab
    print ('-dpng','rgb_mosaic.png');
    ```
5.  Transform the image to the following color spaces and repeat the exercise
    -   ycbcr

    > img=imread('4.2.03.tiff');
    
    > ycbcr=rgb2ycbcr(img);
    
    > y=ycbcr(:,:,1);

    > cb=ycbcr(:,:,2);
    
    > cr=ycbcr(:,:,3);
    
    > figure(1)
    
    > subplot(2,2,1), subimage(ycbcr);
    
    > subplot(2,2,2), subimage(y);
    
    > subplot(2,2,3), subimage(cb);
    
    > subplot(2,2,4), subimage(cr);
    
    > print('-dpng','ycbcr_mosaic.png');
    
    -   lab
    
    > img=imread('4.2.03.tiff');
    
    > lab=rgb2lab(img);
    
    > l=lab(:,:,1);

    > a=lab(:,:,2);
    
    > b=lab(:,:,3);
    
    > figure(1)
    
    > subplot(2,2,1), subimage(lab);
    
    > subplot(2,2,2), subimage(l);
    
    > subplot(2,2,3), subimage(a);
    
    > subplot(2,2,4), subimage(b);
    
    > print('-dpng','lab_mosaic.png');
    
    -   hsv (use [rgb2hsv](http://www.mathworks.com/help/matlab/ref/rgb2hsv.html))

    > img=imread('4.2.03.tiff');
    
    > hsv=rgb2hsv(img);
    
    > h=hsv(:,:,1);

    > s=hsv(:,:,2);
    
    > v=hsv(:,:,3);
    
    > figure(1)
    
    > subplot(2,2,1), subimage(hsv);
    
    > subplot(2,2,2), subimage(h);
    
    > subplot(2,2,3), subimage(s);
    
    > subplot(2,2,4), subimage(v);
    
    > print('-dpng','hsv_mosaic.png');


6.  Save all the mosaics in your github repository

## Pyramids

The [impyramid](http://www.mathworks.com/help/images/ref/impyramid.html) function creates gaussian pyramids from an image.

1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image

    > img=imread('5.1.12.tiff');
    
    > img01=impyramid(img, 'reduce');
    
    > img02=impyramid(img01, 'reduce');
    
    > img03=impyramid(img02, 'reduce');
    
    > img04=impyramid(img03, 'reduce');
    
    > figure(1)
    
    > subplot(3,2,1), subimage(img);
    
    > subplot(3,2,2), subimage(img01);
    
    > subplot(3,2,3), subimage(img02);
    
    > subplot(3,2,4), subimage(img03);
    
    > subplot(3,2,5), subimage(img04);
    
    > print('-dpng','pyr.png');

3.  At what level does the people in the picture dissappear?

    >   On the third level it's not possible to see the people in the picure anymore because of the blur.
    
4.  At what level does the numbers in the clock disappear?

    >   On the second level the numbers are not possible to be differentiated anymore.

## Template Matching

The [norm2corrx](http://www.mathworks.com/help/images/ref/normxcorr2.htm) can be used to look for patterns in an image.

1.  Download the ``sequences.tar.gz`` file (from guitaca or sipi) and decompress it
2.  Go to the sequences directory
3.  Read the ``motion04.512.tiff`` image
4.  Use the ``imcrop`` comand to crop the train at the right side of the figure
    
    ```matlab
    [train,square] = imcrop(image);
    ```
5.  Now use [normxcorr2](http://www.mathworks.com/help/images/ref/normxcorr2.htm) to locate the train back in the image

    ```matlab
    c=normxcorr2(train,image);
    % c is correlation from -1 to 1
    [sx,sy] = size(image);
    d=floor(size(train)/2);
    dx=d(1);
    dy=d(2);
    %Remove borders from c2 to make it the same size as image
    c2=c(dx+1:sx+dx,dy+1:sy+dy);
    %lets accentuate it more
    c3=c2.^3;
    %convert it into an image from 0 to 1
    cr=0.5+0.5*c3;
    %leave the original image as the luminance channel
    y=mat2gray(image);
    %empty cb channel
    cb=0.5*ones(size(image));
    %join the three channels
    ycbcr=cat(3,y,cb,cr);
    rgb=ycbcr2rgb(ycbcr);
    imshow(rgb);
    ```
6.  Explain what the above code does

    > Using 'train' as a template, the code searches for a match of said template in the image. The result is a correlation map where the highest intensity corresponds to the places more similar to the train template.
    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?

    > Even slight changes in luminosity, angle, saturation of the template or image can create a correlation when there's none or totally miss the correct place of the image to find, given that the comparison is not flexible.

See [here](http://www.mathworks.com/help/images/examples/registering-an-image-using-normalized-cross-correlation.html)
another example.

## End

Don't forget to commit and push your answers and images to github

**DUE**: 24/02/2015 ; 8:00 a.m.
