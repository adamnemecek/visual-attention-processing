function demo()
% The MATLAB program is developed to test simulate the ided represented in
% the paper "An Information Theoretic Model of Spatiotemporal Visual
% Saliency".
% All images are initally reduced to a quater of its original size
% There are 4 consecutive images used to calculate the temporal saliency
% map.
    %% Add the common MATLAB fucntions into the folder
    addpath('../comMLFuncs/');
    
    %% Precprocess steps
    clc; close all;

    %% Predefined parameters      
    noImgs = 4;
    szPatches = 8;
    %% Sample images for testing with M = 4
%     imgPath1 = './figures/set4/L_1.jpg'; % Image at t = -3;
    imgPath2 = './figures/set4/L_2.jpg'; % Image at t = -2;
%     imgPath3 = './figures/set4/L_3.jpg'; % Image at t = -1;
%     imgPath4 = './figures/set4/L_4.jpg'; % Image at t = 0; 
%     imgPath5 = './figures/set4/L_5.jpg'; % Image at t = 1; current image
%     % All images are resized by 1/4
%     img1 = imresize(rgb2gray(imread(imgPath1)),0.5);
%     img2 = imresize(rgb2gray(imread(imgPath2)),0.5);
%     img3 = imresize(rgb2gray(imread(imgPath3)),0.5);
%     img4 = imresize(rgb2gray(imread(imgPath4)),0.5);    
%     img5 = imresize(rgb2gray(imread(imgPath5)),0.5);        
%  
%     imgs = cat(3,img1,img2,img3,img4,img5);          

    %% Sample images for testing with M = 8
%     imgPath1 = './figures/set8/L_1.jpg'; 
%     imgPath2 = './figures/set8/L_2.jpg'; 
%     imgPath3 = './figures/set8/L_3.jpg'; 
%     imgPath4 = './figures/set8/L_4.jpg'; 
%     imgPath5 = './figures/set8/L_5.jpg'; 
%     imgPath6 = './figures/set8/L_6.jpg'; 
%     imgPath7 = './figures/set8/L_7.jpg'; 
%     imgPath8 = './figures/set8/L_8.jpg'; 
%     imgPath9 = './figures/set8/L_9.jpg'; 
    
%     imgPath1 = './figures/set8_1/frame-0001.jpg'; 
%     imgPath2 = './figures/set8_1/frame-0002.jpg'; 
%     imgPath3 = './figures/set8_1/frame-0003.jpg'; 
%     imgPath4 = './figures/set8_1/frame-0004.jpg'; 
%     imgPath5 = './figures/set8_1/frame-0005.jpg'; 
%     imgPath6 = './figures/set8_1/frame-0006.jpg'; 
%     imgPath7 = './figures/set8_1/frame-0007.jpg'; 
%     imgPath8 = './figures/set8_1/frame-0008.jpg'; 
%     imgPath9 = './figures/set8_1/frame-0009.jpg'; 
 
%     imgPath1 = './figures/set8_2/frame-0011.jpg'; 
%     imgPath2 = './figures/set8_2/frame-0012.jpg'; 
%     imgPath3 = './figures/set8_2/frame-0013.jpg'; 
%     imgPath4 = './figures/set8_2/frame-0014.jpg'; 
%     imgPath5 = './figures/set8_2/frame-0015.jpg'; 
%     imgPath6 = './figures/set8_2/frame-0016.jpg'; 
%     imgPath7 = './figures/set8_2/frame-0017.jpg'; 
%     imgPath8 = './figures/set8_2/frame-0018.jpg'; 
%     imgPath9 = './figures/set8_2/frame-0019.jpg'; 

    imgPath1 = '../../vap_svn_ghost/imageTestSequence/football/fb-43.jpg';
    imgPath2 = '../../vap_svn_ghost/imageTestSequence/football/fb-44.jpg';
    imgPath3 = '../../vap_svn_ghost/imageTestSequence/football/fb-45.jpg';
    imgPath4 = '../../vap_svn_ghost/imageTestSequence/football/fb-46.jpg';
    imgPath5 = '../../vap_svn_ghost/imageTestSequence/football/fb-47.jpg';
    imgPath6 = '../../vap_svn_ghost/imageTestSequence/football/fb-48.jpg';
    imgPath7 = '../../vap_svn_ghost/imageTestSequence/football/fb-49.jpg';
    imgPath8 = '../../vap_svn_ghost/imageTestSequence/football/fb-50.jpg';
    imgPath9 = '../../vap_svn_ghost/imageTestSequence/football/fb-51.jpg';
    
    % All images are resized by 1/2
    scaleValue = 1;
    img1 = imresize(rgb2gray(imread(imgPath1)),scaleValue);
    img2 = imresize(rgb2gray(imread(imgPath2)),scaleValue);
    img3 = imresize(rgb2gray(imread(imgPath3)),scaleValue);
    img4 = imresize(rgb2gray(imread(imgPath4)),scaleValue);    
    img5 = imresize(rgb2gray(imread(imgPath5)),scaleValue);        
    img6 = imresize(rgb2gray(imread(imgPath6)),scaleValue);        
    img7 = imresize(rgb2gray(imread(imgPath7)),scaleValue);        
    img8 = imresize(rgb2gray(imread(imgPath8)),scaleValue);
    img9 = imresize(rgb2gray(imread(imgPath9)),scaleValue);        
% 
%     img1 = imresize(imread(imgPath1),scaleValue);
%     img2 = imresize(imread(imgPath2),scaleValue);
%     img3 = imresize(imread(imgPath3),scaleValue);
%     img4 = imresize(imread(imgPath4),scaleValue);
%     img5 = imresize(imread(imgPath5),scaleValue);
%     img6 = imresize(imread(imgPath6),scaleValue);
%     img7 = imresize(imread(imgPath7),scaleValue);
%     img8 = imresize(imread(imgPath8),scaleValue);
%     img9 = imresize(imread(imgPath9),scaleValue);    

    if (noImgs == 8)
        imgs = cat(3,img1,img2,img3,img4,img5,img6,img7,img8);      
    elseif (noImgs == 6)
        imgs = cat(3,img1,img2,img3,img4,img5,img6);
    elseif (noImgs == 4)
        imgs = cat(3,img1,img2,img3,img4);
    elseif (noImgs == 2)
        imgs = cat(3,img1,img2);
    end
    
    tic;
    [~,~,ism] = infoSaliencyMap(imgs,szPatches);
    ism(ism < 0) = 0;
%     ism = temporalSaliencyMap(imgs,szPatches);
    toc;    
    
%% Temporarily threshold the saliency map
%     th = sort(unique(ism),'descend');
%     ism(ism < th(1000)) = 0;
%     imshow(ism);

%% Normalized entropy-based saliency map
%     ism_norm = mat2gray(ism);
% %     gaussian_filter = fspecial('gaussian',16,1);
% %     ism_filtered = imfilter(ism_norm,gaussian_filter);       
%     ism_smoothed = smooth2a(ism_norm,8);
%     figure(1);
%     h = imshow(img8);
%     set(h,'AlphaData',ism_smoothed);
%     title('Normalized Entropy-based Saliency Map 1');

%% Show top n salient regions of the image
    n = 20;
    [ismHeight,ismWidth] = size(ism);
    [xGrid,yGrid] = meshgrid(1:ismWidth,1:ismHeight);
    ismValuesCoors = cat(3,ism,yGrid,xGrid);    
    saliencyPoints = fliplr(sortrows(reshape(permute(ismValuesCoors,[3 2 1]),[size(ismValuesCoors,3) numel(ismValuesCoors(:,:,1))])')');   
    saliencyPoints = saliencyPoints(:,1:szPatches*szPatches:n*szPatches*szPatches) ;
    iYs = saliencyPoints(2,:); iXs = saliencyPoints(3,:);
    ism_mask = zeros(ismHeight,ismWidth);
%     ism_mask(iYs,iXs) = ism_mask(iYs,iXs).*(1-eye(length(iYs))) + 1*eye(length(iYs));
    for iCor = 1:1:n
        ism_mask(iYs(iCor),iXs(iCor)) = 1;
    end
    se = strel('disk',szPatches,0);
%     se = strel('square',szPatches);
    ism_mask_dilated = imdilate(ism_mask,se);
    img_thresholded = imgs(:,:,noImgs).*uint8(ism_mask_dilated);
    figure(2);
    imshow(img_thresholded);
    title(['Top ' num2str(n) ' regions in the image']);
 
% %% Applying threshold     
%     threshold = 0.8;
%     ism_thresholded = mat2gray(ism);
%     ism_thresholded(ism_thresholded < threshold) = 0;
%     
%     figure(3);
%     colormap('gray'), imagesc(ism_thresholded);
    
% %% Interpolate the ism_norm
%     [iX,iY] = meshgrid(1:size(ism_norm,2),1:size(ism_norm,3));
%     ism_interpn = interpn(ism_norm*255,iY,iX);
%     figure(2);
%     h = imshow(img4);
%     set(h,'AlphaData',ism_interpn);
%     title('Normalized Entropy-based Saliency Map 2');    
end