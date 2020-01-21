function [NN,save_err,ctr] = train_LF(NN,data,params,mu)
% Back propagation in Batch mode
global denZero 

% mu = .05;
dt = 1;

% TRAINING
Np = size(data.in,1); % No. of patterns
e = zeros(Np*NN.Nn(end),1);
J = zeros(Np*NN.Nn(end),sum(NN.Nw));
ctr = 0;
save_err = zeros(params.K,1);
% save_u = zeros(Nw,params.K);
while true
    for i=1:size(data.in,1)
        x = [data.in(i,:),1]';
        yd = data.out(i,:)';
        % Finding Jacobian
        [Jtemp,v] = dnn_findJ(NN,x);
        J((i-1)*NN.Nn(end)+1:i*NN.Nn(end),:) = Jtemp;
        e((i-1)*NN.Nn(end)+1:i*NN.Nn(end),1) = yd - v(end).v;
    end
    % Terminate
    ctr = ctr+1;
    save_err(ctr) = e'*e;
    if all(abs(e) < params.maxErr) || ctr>params.K
        break;
    end
    
    % Update weights
    temp = J'*e;
    u = mu * (e'*e)/(temp'*temp+denZero) * temp; % u is Nw x 1
    if all(abs(u) < denZero^2) % Stuck in a min
        save_err(ctr:end) = save_err(ctr);
        ctr = params.K+1;
        break;
    end
    NN = dnn_updateW(NN,dt*u);
end


