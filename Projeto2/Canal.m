function So = Canal(Si)
N = sqrt(0.25);
noise = normrnd(0, N);
So = Si + noise;
