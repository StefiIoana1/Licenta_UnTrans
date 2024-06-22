function J=functie_UnTrans_meu(etha)
%
assignin('base','delta',etha)
 
const_UnTrans_FT1_theta_e_de_cu_i;
%
sim('schema_modelNL_RG_FT1_theta_e_de_cu_i_j1_2020b_staircase')

%
J=1/length(e_theta_sim_j1(:,1))*((e_theta_sim_j1(:,1))'*(e_theta_sim_j1(:,1)))
%J=1/length(e_psi_sim_j1(:,1))*((e_psi_sim_j1(:,1))'*(e_psi_sim_j1(:,1)))
%J=1/length(e_phi_sim_j1(:,1))*((e_phi_sim_j1(:,1))'*(e_phi_sim_j1(:,1)))
