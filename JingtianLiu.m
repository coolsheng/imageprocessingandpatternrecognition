clear all
cam = webcam();%create webcam object
eyedetector = vision.CascadeObjectDetector('EyePairBig');%create detector
while true   % Infinite loop to continuously detect
    vid=snapshot(cam);%snapshot
    vid = rgb2gray(vid);%convert to grayscale
    img = flip(vid, 2); %flip the image
    bbox=step(eyedetector,img);
    subplot(1,2,1),subimage(img);
    for i = 1:size(bbox,1)
           rectangle('Position',bbox(i,:),'LineWidth',2,'LineStyle','-','EdgeColor','y');
    end
end