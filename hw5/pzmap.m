function [] = pzmap(gn,fs,gst,ir,ic,in)
% given the impulse response(gn), the sampling rate (fs), and the start time
% of the impulse response and subplot information, draw the pole-zero map.
%ir = row number
%ic = column number
%in = number
subplot(ir,ic,in)
M1=-gst*fs; N=length(gn); M2=N-M1-1;
% find if there are multiple poles or multiple zeros at 0
if ( M1 > 0 & M2 <= 0 ) % all negative or 0 times in impulse response
nz0=-M2; np0=0;
elseif ( M1 > 0 & M2 >0 ) % both negative and positive times in impulse response
nz0=0; np0=M2;
elseif ( M1 <= 0 ) % all 0 or positive times in impulse response
np0=M2; nz0=0;
end
[M1 M2 N np0 nz0]; %n=-M1 to +M2 N pts in filter, #poles and # zeros at origin
uc=exp(j*2*pi*(0:1000)/1000); % unit circle contour
zps=roots(gn); % N-1 roots giving the "interesting" zero positions
% Now plot separated into cases when there are poles at z=0; zeros at z=0;
% and no poles nor zeros at 0.

if ( np0 ~= 0 )
plot(real(zps),imag(zps),'o',[0],[0],'x',real(uc),imag(uc),'-')
text(0.1,0.1,int2str(np0));
elseif (nz0 ~= 0)
plot(real(zps),imag(zps),'o',[0],[0],'o',real(uc),imag(uc),'-')
text(0.1,0.1,int2str(nz0));
else
plot(real(zps),imag(zps),'o',real(uc),imag(uc),'-')
end
% Now make it square and label the axes
xlabel('Real(z)'); ylabel('Imag(z)'); grid on; %vividoc(14,2);
title([' Sample Rate = ' num2str(fs) 'sps. #pts=' int2str(N) ])
set(gca,'PlotBoxAspectRatio',[1 1 1]);
set(gca,'XTick',(-1.5:0.5:1.5))
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
%vividoc(12,1.5)