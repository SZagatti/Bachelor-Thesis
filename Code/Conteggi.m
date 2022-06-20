contatore = zeros(177,1);
for j = 1:2
 
    nomefileA = fopen('/users/sebastianozagatti/Desktop/txt/SA/ListaSA.txt', 'r');
    nomefileB = fopen( '/users/sebastianozagatti/Desktop/txt/SB/ListaSB.txt' , 'r');
    nomefileC = fopen( '/users/sebastianozagatti/Desktop/txt/EDGE ON/ListaEDGEON.txt' , 'r');
    nomefileAA = fopen( strcat('/users/sebastianozagatti/Desktop/txt/SA/','SA',num2str(j),'.txt') , 'r');
    nomefileBB = fopen( strcat('/users/sebastianozagatti/Desktop/txt/SB/','SB',num2str(j),'.txt') , 'r');
    nomefileCC = fopen( strcat('/users/sebastianozagatti/Desktop/txt/EDGE ON/','EDGEON',num2str(j),'.txt') , 'r');
    
    A = textscan(nomefileA,'%s','delimiter','\n', 'MultipleDelimsAsOne', 1) ;
    A = A{1};
    fclose(nomefileA);
    AA = textscan(nomefileAA,'%s','delimiter','\n', 'MultipleDelimsAsOne', 1) ;
    AA = AA{1};
    fclose(nomefileAA);
    for i = 1:177
    for k = 1:177
    tf = strcmp(A(i,1),AA(k,1));
    if tf == 1
        contatore(i,1) = contatore(i,1) + 1;
    end
    end
    disp(A(i,1)) , disp(contatore(i,1))
    end
    
end