% The following part of the code, randomly selects 150 images 
% for the network to use.
Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/SA';  
filePattern = fullfile(Dest, '*.png');               
theFiles = dir(filePattern);                        
for k = 1 : length(theFiles)                        
  baseFileName = theFiles(k).name;                  
  fullFileName = fullfile(Dest, baseFileName);      
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SA', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SA', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/SB';
filePattern = fullfile(Dest, '*.png');
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
    fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SB', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SB', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/ELLITTICHE';
filePattern = fullfile(Dest, '*.png');
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/ELLITTICHE', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/ELLITTICHE', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/EDGE ON';
filePattern = fullfile(Dest, '*.png');
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON', FileList(Index(k)).name);
  copyfile(Source, Dest);
end
% End of the random selection procedure

DataSetPath = fullfile('/home/user/TESI/DATASET3/BASE/Temp3'); % the folder where the images are located is specified
imds = imageDatastore(DataSetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames'); 

labelCount = countEachLabel(imds) % the number of images in each subfolder are counted
img = readimage(imds,1);          % images are read

numTrainFiles = 125;              % the number of images used for training is specified
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize'); % The dataset is splitted into a 
                                                                             % traing and a validation set
% The architecture of the convolutional neural network is built,
% layer layout is specified
layers = [
    imageInputLayer([550 649 3]);
    
     convolution2dLayer(3,8,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer];

% the training options are specified
options = trainingOptions('sgdm', ...
    'ExecutionEnvironment','multi-gpu', ...
    'MaxEpochs', 35, ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',5, ...
    'minibatchsize', 75, ...
    'Verbose',true, ...
    'Plots','training-progress');

% the network is trained using the training set
net = trainNetwork(imdsTrain,layers,options);

% the validation process is carried out using the validation set
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

% the accuracy is computed
accuracy = sum(YPred == YValidation)/numel(YValidation)