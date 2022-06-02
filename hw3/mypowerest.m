function [power_est] = mypowerest(fk,Sxxf, fpeak, M)
%PROBLEM 3-D
%mypowerest. This function takes the Power Spectral Density (which
%is computed through mypsd.m), the corresponding fk vector, the location of 
% the frequency peak (index), and the number of points to integrate around
% and calculates the power through rectangular integration. 

df = fk(2) - fk(1); 

power_est = sum(Sxxf(fpeak -M: fpeak + M) * 2 * df);