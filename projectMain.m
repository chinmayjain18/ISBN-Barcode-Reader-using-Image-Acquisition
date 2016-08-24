example_directory = pwd; % DIRECTORY NAME

regular_expression_for_selection = [ example_directory filesep() '*.JPG' ];

file_list = dir( regular_expression_for_selection );
for index_variable =  1: length(file_list);
    % Read the file
    file_name = file_list( index_variable ).name;
    fprintf( 'File %2d is %-36s --> ', index_variable, file_name );
    full_filename = [ example_directory filesep() file_name ];
    im_OG = imread(file_name);
    % Feature Enhancement
    im = medfilt1(im2double(im_OG));
    im = imadjust(rgb2gray(im));
    im_v1 = im2bw(im);
    %figure;
    %imshow(im_v1);
    %pause(2);
    % Select the Scan Box
    im_v2 = imresize( im_v1, [1024 768]);
    %figure;
    %imshow(im_v2);
    %pause(2);
    [x,y] = size(im_v2);
    cen_x = x/2;
    cen_y = y/2;
    new_x1 = cen_x+ 15;
    new_x2 = cen_x- 15;
    new_y1 = cen_y+ 15;
    new_y2 = cen_y- 15;
    J = imcrop(im_v2,[0 new_y1  1024 new_y2]);
    %figure;
    %imshow(J);
    %pause(2);
    % Rotate the image to straight lines
    theta = getRotation(J);
    J_v2 = imrotate(J,-theta,'bilinear','crop');
    %figure;
    %imshow(J_v2);
    %pause(2);
    % Crop the rotation issues
    dims = size(J_v2);
    J_v3 = imcrop(J_v2,[10 10 dims(2)-15 dims(1)-15]);
    %figure;
    %imshow(J_v3);
    %pause(2);
    % Build the string pattern from the barcode
    % Get the scan row image from the middle of the image
    [x,y] = size(J_v3);
    n = x/2;
    scanLine = J_v3(n,:);
    %figure;
    %imshow(scanLine);
    %pause(2);
    pattern = getPattern(scanLine);
    %size(pattern)
    pattern = imresize(pattern,[1 92]);
    %pattern = colfilt(pattern,[1 8],'distinct',@mode);
    %pattern
    % 92 slot pattern image
    %figure;
    %imshow(pattern);
    pattern = pattern(3:90);
    %imshow(pattern);
    % Build the ISBN number from the string pattern
    %pattern = fliplr(pattern);
    ISBNnumber = getISBNNumber(pattern);
    %ISBNnumber
    ISBNnumber = fixISBNNumber(ISBNnumber);
    figure;
    imshow(im_OG);
    title(ISBNnumber);
end