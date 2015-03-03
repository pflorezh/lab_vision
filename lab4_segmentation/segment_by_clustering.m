function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
work_image=[];
if strcmp(feature_space,'rgb')
    work_image=rgb_image;
else
    if strcmp(feature_space,'lab')
        work_image=rgb2lab(rgb_image);
    else
        if strcmp(feature_space,'hsv')
            work_image=rgb2hsv(rgb_image);
        else
            if strcmp(feature_space,'rgb+xy')
                work_image=rgb2xyz(rgb_image);
            else
                if strcmp(feature_space,'lab+xy')
                    work_image=rgb2lab(rgb_image);
                else
                    if strcmp(feature_space,'hsv+xy')
                        work_image=rgb2hsv(rgb_image);
                    end
                end
            end
        end
    end
end

if strcmp(clustering_method,'kmeans')
    segm=kmeans(work_image,number_of_clusters);
else
    if strcmp(clustering_method,'gmm')
        %cod
    else
        if strcmp(clustering_method,'hierarchical')
            %cod
        else
            if strcmp(clustering_method,'watershed')
                %cod
            end
        end
    end
end
my_segmentation=segm;
end
