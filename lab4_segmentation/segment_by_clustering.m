function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
image=imread(rgb_image);
[A,B,~]=size(image);
if strcmp(clustering_method,'hierarchical')
    image=imresize(image,0.5);
end
if strcmp(feature_space,'rgb')
    im=double(reshape(image(:),[],3));
    work_image=im;
else
    if strcmp(feature_space,'lab')
        im=double(reshape(image(:),[],3));
        [L, a, b]=RGB2Lab(im(:,1),im(:,2),im(:,3));
        work_image=255.*[L a b];
    else
        if strcmp(feature_space,'hsv')
            im=rgb2hsv(image);
            work_image=255.*double(reshape(im(:),[],3));
        else
            if strcmp(feature_space,'rgb+xy')
                im=double(reshape(image(:),[],3));
                con=0;
                for i=1:B
                    for j=1:A
                        con=con+1;
                        im(con,4)=i;
                        im(con,5)=j;
                    end
                end
                work_image=im;
            else
                if strcmp(feature_space,'lab+xy')
                    im=double(reshape(image(:),[],3));
                    [L, a, b]=RGB2Lab(im(:,1),im(:,2),im(:,3));
                    im=255.*[L a b];
                    con=0;
                    for i=1:B
                        for j=1:A
                            con=con+1;
                            im(con,4)=i;
                            im(con,5)=j;
                        end
                    end
                    work_image=im;
                else
                    if strcmp(feature_space,'hsv+xy')
                        im=rgb2hsv(image);
                        im=255.*double(reshape(im(:),[],3));
                        con=0;
                        for i=1:B
                            for j=1:A
                                con=con+1;
                                im(con,4)=i;
                                im(con,5)=j;
                            end
                        end
                        work_image=im;
                    else 
                        disp('Error en feature_space');
                    end
                end
            end
        end
    end
end

if strcmp(clustering_method,'kmeans')
    clust=kmeans(work_image,number_of_clusters);
    clust=reshape(clust, A, B);
    figure;
    imshow(clust,[]);
    colormap colorcube;
    segm=clust;
else
    if strcmp(clustering_method,'gmm')
        clust=cluster(gmdistribution.fit(work_image, number_of_clusters), work_image);
        clust=reshape(clust, A, B);
        figure
        imshow(clust,[])
        colormap colorcube
        segm=clust;
    else
        if strcmp(clustering_method,'hierarchical')
            clust=linkage(work_image,'ward','euclidean');
            clust=cluster(clust,'maxclust',number_of_clusters);
            clust=reshape(clust(:), A, B);
            figure
            imshow(clust,[])
            colormap colorcube
            segm=clust;
        else
            if strcmp(clustering_method,'watershed')
                im=rgb2gray(image);
                Hy= fspecial('sobel');
                Hx= Hy';
                Iy= imfilter(double(im), Hy, 'replicate');
                Ix = imfilter(double(im), Hx, 'replicate');
                grad = sqrt(Ix.^2+Iy.^2);
                marker = imextendedmin(grad, number_of_clusters);
                new_grad= imimposemin(grad, marker);
                ws= watershed(new_grad);
                figure
                imshow(ws==0)
                segm=new_grad;
            else
                disp('Error en clustering_method');
            end
        end
    end
end
my_segmentation=segm;
end
