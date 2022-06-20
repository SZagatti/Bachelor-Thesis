BB = imread('image.png');
    C = imrotate(BB,(39),'crop');
    D = imrotate(BB,(39),'bilinear','crop');
    E = imrotate(BB,(39),'bicubic','crop');
    imwrite(C,'1_nearest.png');
    imwrite(D,'2_bilinear.png'); 
    imwrite(E,'3_bicubic.png');