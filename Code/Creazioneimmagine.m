righe = 50;
colonne = 50;
sigma_x = 8;
sigma_y = 12;
x_0 = colonne / 2;
y_0 = righe / 2;
image=zeros(righe,colonne,3); %initialize
for k = 2 : 3
    for i = 1:colonne %larghezza
        for j = 1:righe %altezza
        image(j,i,k) = exp(-((i - x_0)^2 / (2. * sigma_x^2))-((j - y_0)^2 / (2. * sigma_y^2)));
        end
    end
end
figure, imshow(image);
imwrite(image,'image.png');