function Ima2(vec)
% Ima2  Display a 16x16 digit image stored as a 256x1 column vector
%   Usage: Ima2(x) where x is 256x1

    img = reshape(vec, 16, 16)';   % reshape and transpose
    imagesc(img);                  % scaled image display
    colormap(gray);                % use grayscale
    axis image off;                % square pixels, no axes ticks
end
