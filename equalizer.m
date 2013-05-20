% EQUALIZER 
%       FILTERED=equalizer(X,GAINS)
%       X is the sampled WAV file, given by wavread()
%       elements of GAINS range from -10 to 10, taken from the GUI sliders
%       FILTERED is the resulting output signal, sent to sound(Y,fs)
function filtered = equalizer(x,gains)

%---filter parameters---
%   maximum allowed by specs for FIR type 1  
M  =    512;  
L  =    M+1;    
n  =    0:1:L-1;

%---gain conversion---
%   convert input GAINS from (dB) to (A)
%   dB=20log(A)
gains = [10.^(gains./20) 0];

%---frequency band specifications---
%   sampling frequency
fs  =	44100;
%   frequency cutoffs, scaled by fs
f   =   [200 400 800 1600 3200 6400 12800 fs/2]./fs; 

%---band construction---
%	b(1,:) is the first band
%	b(2,:) is the second band, etc.
%   implements equation(7.81) from DSP text
b=zeros(8,L);       %	preallocate b
for k=1:8
   b(k,:)=2.*f(k).*sinc(2.*f(k).*(n-M/2));
end

%---filter construction---
%	hd is the impulse response
%   implements equation(7.81) from DSP text
hd=zeros(1,L);      %	preallocate hd
for k=1:8
   hd=hd+(gains(k)-gains(k+1)).*b(k,:);
end

%---Kaiser window---
beta  =  0;
w=kaiser(L,beta)';
h=hd.*w;

%---Discrete Fourier Transform---
H = fft(h, L);                   
positive_values = ceil((L+1)/2); %  gets highest positive frequency
H = H(1:positive_values);        %  removes negative frequencies

%---magnitude response plot---
Hdb=20*log10(abs(H));            %	convert to dB
f=linspace(0,fs/2,length(H));    %  frequency axis scale
figure();
plot(f,Hdb);            grid on;
axis([0 fs/2 -20 20]);  title('Magnitude Response'); 
xlabel('f (Hz)');       ylabel('|H(f)| (dB)');

%---impulse response plot---
figure();
plot(n,h);              grid on;
axis([0 512 -.6 1.6]);	title('Filter Coefficients'); 
xlabel('n');            ylabel('h[n]');

%---process and return output---
filtered=conv(h,x);  %   convolution in time<->multiplication in freq


