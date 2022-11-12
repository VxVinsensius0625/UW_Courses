format long e
% 6.4
A = [1,0;0,1;1,0];
ans_6a_1 = A*(A'*A)^(-1)*A';
x = [1,2,3]';
ans_6a_2 = ans_6a_1*x;
B = [1,2;0,1;1,0];
ans_6b_1 = B*(B'*B)^(-1)*B';
ans_6b_2 = ans_6b_1*x;

%%%%% 11.3
t = linspace(0,1,50);
Atil = fliplr(vander(t));
A = Atil(:,1:12);
b = cos(4*t');

% Part a - least square via normal eq
R = chol(A'*A); % cholesky factorization
w_a = R'\(A'*b); % solve lower triangular sys R*w = A*b
x_a = R\w_a; % solve upper triangular sys Rx = w
% part d - least square via qr
[q,r] = qr(A,'econ');
x_d = r\(q'*b);
% part e - least square via \
x_e = A\b;
% part f - least squart via svd
[u,sig,v] = qr(A,'econ');
w_f = sig\(u'*b); % solve diagonal system sw= u*b
x_f = v*w_f;

%%%% Ranking question
A_rank_6 = [1,-1,0,0;-1,0,1,0;1,0,0,-1;0,0,1,-1;0,1,0,-1;1,1,1,1];
b_rank_6 = [4,9,6,3,7,20]';
x_rank_6 = A_rank_6\b_rank_6;

A_rank_5 = [1,-1,0,0;-1,0,1,0;1,0,0,-1;0,0,1,-1;0,1,0,-1];
b_rank_5 = [4,9,6,3,7]';
x_rank_5 = A_rank_5\b_rank_5;

A_rank_61 = [1,-1,0,0;-1,0,1,0;1,0,0,-1;0,0,1,-1;0,1,0,-1;1,1,1,1];
b_rank_61 = [4,9,6,3,7,30]';
x_rank_61 = A_rank_61\b_rank_61;